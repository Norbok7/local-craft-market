class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :verify_authenticity_token, except: [:index, :show]
  skip_before_action :authenticate_request, only: :create  # Skip authentication for the create action

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content, status: :ok
  end

  def current
    if current_user
      render json: current_user, status: :ok
    else
      render json: { errors: 'User not found' }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :user_type)
  end
end
