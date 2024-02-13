class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :update, :destroy]
  before_action :set_order, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:update, :destroy] # Skip CSRF token verification for the update action

  def index
    @order_items = OrderItem.all
    render json: @order_items, status: :ok
  end

  def show
    render json: @order_item, status: :ok
  end

  def create
    @order_item = @order.order_items.build(order_item_params)
    if @order_item.save
      render json: @order_item, status: :created
    else
      render json: { errors: @order_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @order_item.update(order_item_params)
      render json: @order_item, status: :ok
    else
      render json: { errors: @order_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @order_item.destroy
    head :no_content, status: :ok
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def set_order
    @order = Order.find(params[:order_item][:order_id])  # Change to order_item
  end

  def order_item_params  # Rename to order_item_params
    params.require(:order_item).permit(:quantity, :unit_price, :order_id, :product_id)  # Change order to order_item
  end
end
