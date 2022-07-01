class CategoriesController < ApplicationController
  skip_before_action :require_login!, only: %i[update create]
  # GET /category
  def index
    @category = Category.all
    render json: @category, methods: [:image_url], status: :ok
  end

  # GET /category/[:id]
  def show
    @category = Category.where(id: params[:id])
    if @category
      render json: @category, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def show_country
    @category = Category.where(region: params[:id])
    if @category
      render json: @category, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /category
  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: { errors: @category.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/category/[:id]

  def update
    @category = Category.find_by(id: params[:id])
    if @category.update(category_params)
      render json: @current_category, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id]).destroy
    if @category
      render json: { Message: "Delete category" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def latest
    @category = Category.last
    render json: CategorySerializer.new(@category).serializable_hash[:data][:attributes]
  end

  private

  def category_params
    params.permit(:category_name, :price_col_complete, :price_col_half, :price_spain, :region, :image,
                  :sector_id, :body)
  end
end
