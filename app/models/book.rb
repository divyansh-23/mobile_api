class Book < ApplicationRecord
  belongs_to :author
  has_many :genres, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
