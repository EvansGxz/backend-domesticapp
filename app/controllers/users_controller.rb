class UsersController < ApplicationController
  skip_before_action :require_login!, only: %i[create create_social create_employee create_customer create_admin]

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      case @user.user_type
      when "customer"
        @user.customer = Customer.create
        render json: @user.customer, include: [:customer], methods: [:image_url], status: :created
        # render json: @user.customer, include: [:customer], status: :created
      when "employee"
        @user.employee = Employee.create
        render json: @user.employee, include: [:employee], methods: [:image_url], status: :created
      when "admin"
        @user.admin = Admin.create
        render json: @user.admin, include: [:admin], methods: [:image_url], status: :created
      end
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def create_employee
    @user = User.find_by(id: params[:id])

    if @user.employee.update(employee_params)
      render json: @user.employee, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def create_customer
    @user = User.find_by(id: params[:id])

    if @user.customer.update(customer_params)
      render json: @user.customer, methods: [:image_url], status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def create_admin
    @user = User.find_by(id: params[:id])

    if @user.admin.update(admin_params)
      render json: @user.admin, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def admin
    @user = User.where(user_type: "admin")
    render json: @user, include: [:admin], status: :ok
  end

  def admin_profile
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user.admin, include: [:admin], status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # GET /users
  def index
    @user = User.all

    render json: @user, status: :ok
  end

  def employee
    @user = User.where(user_type: "employee")

    render json: @user, include: [:employee], status: :ok
  end

  def customer
    @user = User.where(user_type: "customer")
    render json: @user, include: [:customer], status: :ok
  end

  def customer_profile
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user.customer, include: [:customer], status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def employee_profile
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user.employee, include: [:employee], status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # GET /profile
  def show
    if @current_user.customer
      render json: @current_user.customer, include: [:customer], methods: [:image_url],
             status: :created
    elsif @current_user.employee
      render json: @current_user.employee, include: [:employee], methods: [:image_url],
             status: :created
    else
      render json: @current_user.admin, include: [:admin], methods: [:image_url], status: :ok
    end
  end

  # PATCH/PUT /users/:id
  def update
    if current_user.customer.update(customer_params)
      render json: current_user.customer, status: :ok
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id]).destroy
    if @user
      render json: { Message: "Delete User" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def user_params
    params.permit(:user_type, :email, :phone, :password, :password_confirmation, :lada)
  end

  def employee_params
    params.permit(:full_name, :country, :document_id, :document_type, :contact, :region,
                  :cover, :experience, :biografy, :phone, :birth_date, :user_id, :contrato)
  end

  def social_params
    params.permit(:social_id)
  end

  def customer_params
    params.permit(:document_id, :client_type, :birth_date, :region, :cod_refer, :country,
                  :document_type, :full_name, :encargado, :cover)
  end

  def admin_params
    params.permit(:nickname, :role, :cover)
  end
end
