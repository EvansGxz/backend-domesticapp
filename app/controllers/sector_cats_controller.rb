class SectorCatsController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /category
  def index
    @sector = SectorCat.all
    render json: @sector, status: :ok
  end

  # GET /category/[:id]
  def show
    @sector = SectorCat.find_by(id: params[:id])
    if @sector
      render json: @sector, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /category
  def create
    @sector = SectorCat.new(sector_params)
    if @sector.save
      render json: @sector, status: :created
    else
      render json: { errors: @sector.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/category/[:id]

  def update
    @sector = SectorCat.find_by(id: params[:id])
    if @sector.update(sector_params)
      render json: @sector, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy
    @sector = SectorCat.find_by(id: params[:id]).destroy
    if @sector
      render json: { Message: "Delete sector" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def sector_params
    params.require(:sector_cats).permit(:service_id, :category_id)
  end
end
