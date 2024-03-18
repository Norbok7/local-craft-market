class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
    render json: @orders, status: :ok
  end

  def show
    render json: @order, status: :ok
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = @current_user.id  # Assuming you have a method to get the current user
  
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
  
  # Define a custom action to fetch orders by user ID
  def by_user
    @orders = Order.where(user_id: params[:user_id])
    render json: @orders, status: :ok
  end

  def edit
  end

  def update
    if @order.update(order_params)
      render json: @order, status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    head :no_content, status: :ok
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_date, :total_amount, :user_id)
  end
end
