class ApplicationController < ActionController::Base
  before_action :authenticate_request, except: [:create] # Skip authentication for create action

  private

  def authenticate_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      @decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)
      @current_user = User.find(@decoded[0]['user_id'])
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :unauthorized
    rescue StandardError => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end
