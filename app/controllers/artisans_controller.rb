class ArtisansController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_artisan, only: [:show, :edit, :update, :destroy]

  def index
    @artisans = Artisan.all
    render json: @artisans, status: :ok
  end

  def show
    render json: @artisan, status: :ok
  end

  def new
    @artisan = Artisan.new
  end

  def create
    @artisan = Artisan.new(artisan_params)
    if @artisan.save
      render json: @artisan, status: :created
    else
      render json: @artisan.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @artisan.update(artisan_params)
      render json: @artisan, status: :ok
    else
      render json: @artisan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @artisan.destroy
    head :no_content, status: :ok
  end

  private

  def set_artisan
    @artisan = Artisan.find(params[:id])
  en
