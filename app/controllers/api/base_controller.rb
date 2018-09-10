# frozen_string_literal: true

class Api::BaseController < ActionController::API
  before_action :authorize_user_doorkeeper_access
  before_action :doorkeeper_authorize!
  respond_to :json

  private

  def current_mobile_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def doorkeeper_unauthorized_render_options(error: nil)
    { json: { message: error.description } }
  end

  def render_error_response(message)
    render_response(message, 400)
  end

  def render_success_response(message)
    render_response(message, 200)
  end

  def render_not_found_response(message)
    render_response(message, 404)
  end

  def render_response(message, code)
    render json: { message: message }, status: code
  end

  def authorize_user_doorkeeper_access
    current_mobile_user
  end
end
