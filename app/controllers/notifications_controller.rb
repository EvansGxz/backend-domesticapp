class NotificationsController < ApplicationController
  skip_before_action :require_login!, only: :create_all
# Customers
  # GET /notifications
  def index
    @notification = CustomerNotification.all
    render json: @notification, status: :ok
  end

  # GET /CustomerNotification/[:id]
  def show
    @notification = CustomerNotification.where(customer_id: params[:id])
    if @notification
      render json: @notification, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /CustomerNotification
  def create
    @notification = CustomerNotification.new(notification_params)
    if @notification.save
      render json: @notification, status: :created
    else
      render json: { errors: @notification.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/CustomerNotification/[:id]

  def update
    @notification = CustomerNotification.find_by(id: params[:id])
    if @notification.update(notification_params)
      render json: @current_CustomerNotification, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

#Notificaciones
  # GET /notifications
  def index_all
    @notification = Notification.all
    render json: @notification, status: :ok
  end

  # GET /Notification/[:id]
  def show_all
    @notification = Notification.where(user_id: params[:id])
    if @notification
      render json: @notification, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /Notification
  def create_all
    @notification = Notification.new(notification_all_params)
    if @notification.save
      render json: @notification, status: :created
    else
      render json: { errors: @notification.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/Notification/[:id]

  def update_all
    @notification = Notification.find_by(id: params[:id])
    if @notification.update(notification_all_params)
      render json: @current_Notification, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy_all
    @notification = Notification.find_by(id: params[:id]).destroy
    if @notification
      render json: { Message: "Delete notification" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

# Private

  private

  def notification_params
    params.permit(:name, :body, :customer_id)
  end

  def notification_all_params
    params.permit(:name, :body, :user_id)
  end
end
