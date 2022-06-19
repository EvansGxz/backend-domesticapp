class AddressesController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /address
  def index
    @address = Address.all
    render json: @address, status: :ok
  end

  # GET /address/[:id]
  def show
    @address = Address.where(customer_id: params[:id])
    if @address
      render json: @address, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /address
  def create
    @address = Address.new(address_params)
    if @address.save
      render json: @address, status: :created
    else
      render json: { errors: @address.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/address/[:id]

  def update
    @address = Address.find_by(id: params[:id])
    if @address.update(address_params)
      render json: @current_address, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def address_params
    params.permit(:address, :customer_id)
  end
end
