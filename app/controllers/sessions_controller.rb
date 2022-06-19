class SessionsController < ApplicationController
  skip_before_action :require_login!, only: %i[create login_phone login_social]

  # POST /login
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      if user.customer
        render json: user.customer, include: [:customer], status: :ok
      elsif user.employee
        render json: user.employee, include: [:employee], status: :ok
      elsif user.admin
        render json: user.admin, include: [:admin], status: :ok
      end
    else
      render_unauthorized("Correo o contraseña incorrectos")
    end
  end

  def login_phone
    user = User.authenticate_phone(params[:phone])

    if user
      if user.customer
        render json: user.customer, include: [:customer], status: :ok
      elsif user.employee
        render json: user.employee, include: [:employee], status: :ok
      elsif user.admin
        render json: user.admin, include: [:admin], status: :ok
      end
    else
      render_unauthorized("Celular incorrecto")
    end
  end

  def login_social
    user_auth = User.find_by(email: params[:email])

    if user_auth
      user = User.authenticate_social(params[:email])
      render json: user.customer, include: [:customer], status: :ok
    else
      create_social
    end
  end

  def destroy
    current_user.invalidate_token
    render json: { Message: "You logout successfully" }, status: :ok
  end

  private

  def create_social
    @user = User.new(
      social_id: params[:social_id],
      email: params[:email],
      user_type: "customer",
      password: SecureRandom.urlsafe_base64
    )
    if @user.save
      case @user.user_type
      when "customer"
        @user.customer = Customer.create
        render json: @user.customer, include: [:customer], methods: [:image_url], status: :created
      end
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end
end
