class ServiceReportsController < ApplicationController
  skip_before_action :require_login!, only: %i[create_all destroy_all]
  
  # GET /notifications
  def index_all
    @report = ServiceReport.all
    render json: @report, status: :ok
  end

  # GET /report/[:id]
  def show_all
    @report = ServiceReport.where(user_id: params[:id])
    if @report
      render json: @report, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /report
  def create_all
    @report = ServiceReport.new(report_params)
    if @report.save
      render json: @report, status: :created
    else
      render json: { errors: @report.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/report/[:id]

  def update_all
    @report = ServiceReport.find_by(id: params[:id])
    if @report.update(report_params)
      render json: @current_report, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy_all
    @report = ServiceReport.find_by(id: params[:id]).destroy
    if @report
      render json: { Message: "Delete report" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # Private

  private

  def report_params
    params.permit(:body, :cover, :order_detail_id)
  end
end
