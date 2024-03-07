class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @reviews = Review.all
    render json: @reviews, status: :ok
  end

  def show
    render json: @review, status: :ok
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review, status: :created
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

    # GET /products/:product_id/reviews
    def by_product
      @reviews = Review.where(product_id: params[:product_id])
      render json: @reviews, status: :ok
    end

  def update
    if @review.update(review_params)
      render json: @review, status: :ok
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    head :no_content, status: :ok
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :product_id, :rating, :comment)
  end
end
