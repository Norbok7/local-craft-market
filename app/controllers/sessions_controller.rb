class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: :create
  skip_before_action :verify_authenticity_token, only: :create # Add this line to skip CSRF token verification for the create action

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, user_id: user.id, user_type: user.user_type }
    else
      artisan = Artisan.find_by(username: params[:username])
      if artisan && artisan.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: artisan.id)
        render json: { token: token, user_id: artisan.id, user_type: 'Artisan' }
      else
        puts "Login failed. User: #{params[:username]}, Password: #{params[:password]}"
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  end

  def destroy
    # You may want to implement a logout functionality for JWT tokens, but it's not common.
    # Since JWT tokens are stateless, there's no explicit logout method.
    # Typically, you'd rely on the token's expiration time for "logout".
    render json: { message: 'Logout successful' }
  end
end
