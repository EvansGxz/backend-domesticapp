class NewslattersController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /category
  def index
    @newslatters = Newslatter.all
    render json: @newslatters, status: :ok
  end

  # GET /category/[:id]
  def show
    @newslatters = Newslatter.find_by(id: params[:id])
    if @newslatters
      render json: @newslatters, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /category
  def create
    @newslatters = Newslatter.new(newslatters_params)
    if @newslatters.save
      render json: @newslatters, status: :created
    else
      render json: { errors: @newslatters.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/category/[:id]

  def update
    @newslatters = Newslatter.find_by(id: params[:id])
    if @newslatters.update(newslatters_params)
      render json: @newslatters, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy
    @newslatters = Newslatter.find_by(id: params[:id]).destroy
    if @newslatters
      render json: { Message: "Delete newslatters" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def newslatters_params
    params.require(:newslatter).permit(:title, :body)
  end
end
