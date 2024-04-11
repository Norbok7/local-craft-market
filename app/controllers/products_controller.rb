class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:index]  # Skip authentication for index action
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def show
    render json: @product, status: :ok
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      Rails.logger.error("Errors occurred while creating product: #{@product.errors}")
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :no_content, status: :ok
  end

  def by_artisan
    @products = Product.where(artisan_id: params[:artisan_id])
    render json: @products, status: :ok
  end
  
  

  private

  def set_product
    @product = Product.find(params[:id])
  end
  
  def product_params
    params.require(:product).permit(:title, :description, :category, :price, :quantity, :image_url, :artisan_id)
  end
end
