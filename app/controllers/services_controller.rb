class ServicesController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /service
  def index
    @service = Service.all
    render json: @service, status: :ok
  end

  # GET /service/[:id]
  def show
    @service = Service.where(category_id: params[:id])
    if @service
      render json: @service, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def show_service
    @service = Service.find_by(id: params[:id])
    if @service
      render json: @service, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /service
  def create
    @service = Service.new(service_params)
    if @service.save
      render json: @service, status: :created
    else
      render json: { errors: @service.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/service/[:id]

  def update
    @service = Service.find_by(id: params[:id])
    if @service.update(service_params)
      render json: @service, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy
    @service = Service.find_by(id: params[:id]).destroy
    if @service
      render json: { Message: "Delete service" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def service_params
    params.permit(:service_name, :category_id)
  end
end
