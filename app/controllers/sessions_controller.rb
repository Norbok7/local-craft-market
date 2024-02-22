class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def destroy
    # You may want to implement a logout functionality for JWT tokens, but it's not common.
    # Since JWT tokens are stateless, there's no explicit logout method. 
    # Typically, you'd rely on the token's expiration time for "logout".
    render json: { message: 'Logout successful' }
  end
end
