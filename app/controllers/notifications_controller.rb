class NotificationsController < ApplicationController
  skip_before_action :require_login!, only: :create
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

  private

  def notification_params
    params.permit(:name, :body, :customer_id)
  end
end
