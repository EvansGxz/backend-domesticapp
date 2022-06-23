class HabilityEmployeesController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /hability
  def index
    @hability = HabilityEmployee.all
    render json: @hability, status: :ok
  end

  # GET /hability/[:id]
  def show
    @hability = HabilityEmployee.where(employee_id: params[:id])
    if @hability
      render json: @hability, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def show_he
    @hability = HabilityEmployee.find_by(id: params[:id])
    if @hability
      render json: @hability, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /category
  def create
    @hability = HabilityEmployee.new(hability_params)
    if @hability.save
      render json: @hability, status: :created
    else
      render json: { errors: @hability.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @HabilityEmployee = HabilityEmployee.find_by(id: params[:id]).destroy
    if @HabilityEmployee
      render json: { Message: "Delete HabilityEmployee" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # PATCH/category/[:id]

  def update
    @hability = HabilityEmployee.find_by(id: params[:id])
    if @hability.update(hability_params)
      render json: @hability, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def hability_params
    params.permit(:hability_id, :employee_id)
  end
end
