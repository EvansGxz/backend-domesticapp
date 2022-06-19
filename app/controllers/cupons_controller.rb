class CuponsController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /category
  def index
    @cupon = Cupon.all
    render json: @cupon, status: :ok
  end

  # GET /category/[:id]
  def show
    @cupon = Cupon.find_by(name: params[:id])
    if @cupon
      render json: @cupon, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def show_cupon
    @cupon = CuponUser.where(cupon_id: params[:id])
    if @cupon
      render json: @cupon, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def cupon
    @cupon = Cupon.find_by(id: params[:id])
    if @cupon
      render json: @cupon, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end


  # POST /category
  def create
    @cupon = Cupon.new(cupon_params)
    if @cupon.save
      render json: @cupon, status: :created
    else
      render json: { errors: @cupon.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/category/[:id]

  def update
    @cupon = Cupon.find_by(id: params[:id])
    if @cupon.update(cupon_params)
      render json: @cupon, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy
    @cupon = Cupon.find_by(id: params[:id]).destroy
    if @cupon
      render json: { Message: "Delete cupon" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end


  private

  def cupon_params
    params.permit(:name, :discount, :cupon_title, :end_date)
  end
end
