class OrderDetailsController < ApplicationController
  skip_before_action :require_login!, only: %i[create update]
  # GET /order_details
  def index
    @order_details = OrderDetail.all
    render json: @order_details, status: :ok
  end

  # GET /order_details/[:id]
  def show
    @order_details = OrderDetail.find_by(id: params[:id])
    if @order_details
      render json: @order_details, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def show_order
    @order_details = OrderDetail.where(id: params[:id])
    if @order_details
      render json: @order_details, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def show_customer
    @order_details = OrderDetail.where(customer_id: params[:id])
    if @order_details
      render json: @order_details, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def show_employee
    @order_details = OrderDetail.where(employee_id: params[:id])
    if @order_details
      render json: @order_details, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /order_details
  def create
    @order_details = OrderDetail.new(order_detail_params)
    if @order_details.save
      render json: @order_details, status: :created
    else
      render json: { errors: @order_details.errors }, status: :unprocessable_entity
    end
  end

  def latest
    @order_details = OrderDetail.last
    render json: @order_details, status: :created
  end

  # PATCH/order_details/[:id]
  def update
    @order_details = OrderDetail.find_by(id: params[:id])
    if @order_details.update(order_detail_params)
      render json: @order_details, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy
    @order_details = OrderDetail.find_by(id: params[:id]).destroy
    if @order_details
      render json: { Message: "Delete order_details" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def order_detail_params
    params.permit(:address, :start_date, :finish_date, :service_time, :discount, :workday,
                  :supply_food, :category_id, :active, :employee_id, :customer_id)
  end
end
