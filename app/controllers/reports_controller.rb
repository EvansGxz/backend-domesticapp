class ReportsController < ApplicationController
  skip_before_action :require_login!, only: :create_all
    # GET /notifications
    def index_all
      @report = Report.all
      render json: @report, status: :ok
    end
  
    # GET /report/[:id]
    def show_all
      @report = Report.where(user_id: params[:id])
      if @report
        render json: @report, status: :ok
      else
        render json: { errors: "Not found" }, status: :not_found
      end
    end
  
    # POST /report
    def create_all
      @report = Report.new(report_all_params)
      if @report.save
        render json: @report, status: :created
      else
        render json: { errors: @report.errors }, status: :unprocessable_entity
      end
    end
  
    # PATCH/report/[:id]
  
    def update_all
      @report = Report.find_by(id: params[:id])
      if @report.update(report_all_params)
        render json: @current_report, status: :ok
      else
        render json: { errors: "Not found" }, status: :not_found
      end
    end
  
    def destroy_all
      @report = Report.find_by(id: params[:id]).destroy
      if @report
        render json: { Message: "Delete report" }, status: :ok
      else
        render json: { errors: "Not found" }, status: :not_found
      end
    end
  
  # Private
  
    private
  
    def report_params
      params.permit(:name, :body, :customer_id, :employee_id, :cover)
    end
  
end
