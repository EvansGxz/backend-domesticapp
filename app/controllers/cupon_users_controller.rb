class CuponUsersController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /category
  def index
    @cupon = CuponUser.all
    render json: @cupon, status: :ok
  end

  # GET /category/[:id]
  def show
    @cupon = CuponUser.where(customer_id: params[:id])
    if @cupon
      render json: @cupon, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /category
  def create
    @cupon = CuponUser.new(cupon_params)
    if @cupon.save
      render json: @cupon, status: :created
    else
      render json: { errors: @cupon.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/category/[:id]

  def update
    @cupon = CuponUser.find_by(id: params[:id])
    if @cupon.update(user_params)
      render json: @cupon, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy
    @cupon = CuponUser.find_by(cupon_id: params[:id]).destroy
    if @cupon
      render json: { Message: "Delete cupon" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def cupon_params
    params.permit(:cupon_id, :customer_id)
  end
end
