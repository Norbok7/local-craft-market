class ArtisansController < ApplicationController
  before_action :set_artisan, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :authenticate_request, except: [:index, :show, :create] # Ensure authentication for all actions except index, show, and create

  # GET /artisans
  def index
    @artisans = Artisan.all
    render json: @artisans, status: :ok
  end

  # GET /artisans/:id
  def show
    render json: @artisan, status: :ok
  end

  # GET /artisans/:id/products
  def by_artisan
    @products = Product.where(artisan_id: params[:id])
    render json: @products, status: :ok
  end

  
  
  # GET /artisans/new
  def new
    @artisan = Artisan.new
  end

  # POST /artisans
  def create
    @artisan = Artisan.new(artisan_params)
    if @artisan.save
      render json: @artisan, status: :created
    else
      render json: { errors: @artisan.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /artisans/:id/edit
  def edit
  end

  # PATCH /artisans/:id
  def update
    if @artisan.update(artisan_params)
      render json: @artisan, status: :ok
    else
      render json: { errors: @artisan.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /artisans/:id
  def destroy
    @artisan.destroy
    head :no_content, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artisan
    @artisan = Artisan.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def artisan_params
    params.require(:artisan).permit(:username, :password, :bio, :user_type) # Ensure userType is permitted here
  end
end
