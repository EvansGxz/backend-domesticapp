class ReviewsController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /review
  def index
    @review = Review.all
    render json: @review, status: :ok
  end

  # GET /review/[:id]
  def show
    @review = Review.where(employee_id: params[:id])
    if @review
      render json: @review, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /category
  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review, status: :created
    else
      render json: { errors: @review.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/category/[:id]

  def update
    @review = Review.find_by(id: params[:id])
    if @review.update(user_params)
      render json: @review, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def review_params
    params.permit(:body, :score, :customer_id, :employee_id)
  end
end
