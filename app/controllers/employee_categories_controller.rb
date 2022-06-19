class EmployeeCategoriesController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /category
  def index
    @employee_category = EmployeeCategory.all
    render json: @employee_category, status: :ok
  end

  # GET /EmployeeCategory/[:id]
  def show
    @employee_category = EmployeeCategory.where(category_id: params[:id])
    if @employee_category
      render json: @employee_category, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def show_employee
    @employee_category = EmployeeCategory.where(employee: params[:id])
    if @employee_category
      render json: @employee_category, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /EmployeeCategory
  def create
    @employee_category = EmployeeCategory.new(employee_category_params)
    if @employee_category.save
      render json: @employee_category, status: :created
    else
      render json: { errors: @employee_category.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/EmployeeCategory/[:id]

  def update
    @employee_category = EmployeeCategory.find_by(id: params[:id])
    if @employee_category.update(user_params)
      render json: @current_EmployeeCategory, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def employee_category_params
    params.permit(:category_id, :employee_id)
  end
end
