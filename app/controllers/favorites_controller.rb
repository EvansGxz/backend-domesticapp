class FavoritesController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /favorites
  def index
    @favorite = Favorite.all
    render json: @favorite, status: :ok
  end

  # POST /favorites
  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      render json: @favorite, status: :created
    else
      render json: { errors: @favorite.errors }, status: :unprocessable_entity
    end
  end

  # GET /favorites/[:id]
  def show
    @favorite = Favorite.where(customer_id: params[:id])
    if @favorite
      render json: @favorite, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def favorite_params
    params.permit(:customer_id, :employee_category_id)
  end
end
