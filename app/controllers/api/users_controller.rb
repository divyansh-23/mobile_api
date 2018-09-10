# frozen_string_literal: true

# rubocop:disable ClassLength
class Api::UsersController < Api::BaseController
  before_action :doorkeeper_authorize!

  respond_to :json

  def search
    render json: { authors: authors_search, books: books_search, reviews:  review_search}
  end

  def user
    user = User.find_by(id: params[:id])
    respond_with user
  end

  def review_search
    Review.where('reviewer_name like :query OR review_title like :title OR review_description like :desc', 
                  query: "%#{params[:keyword]}%", title: "%#{params[:keyword]}%", desc: "%#{params[:keyword]}%")
  end

  def books_search
    books = Book.joins(:genres).where('short_description like :query OR long_description like :title OR genres.name like :g_name OR books.name like :b_name',
                      query: "%#{params[:keyword]}%", title: "%#{params[:keyword]}%", g_name: "%#{params[:keyword]}%", b_name: "%#{params[:keyword]}%").group("books.id")
    books.each_with_object([]) do |book, records|
      records << book.as_json.merge(genres: book.genres.pluck(:name))
    end
  end

  def authors_search
    Author.where('name like :query OR bio like :title', query: "%#{params[:keyword]}%", title: "%#{params[:keyword]}%")
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
