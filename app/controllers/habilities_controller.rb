class HabilitiesController < ApplicationController
  skip_before_action :require_login!, only: :create
  # GET /hability
  def index
    @hability = Hability.all
    render json: @hability, includes: %i[hability created_at], methods: [:image_url],
    status: :ok
  end

  # GET /hability/[:id]
  def show
    @hability = Hability.find_by(id: params[:id])
    if @hability
      render json: @hability, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  # POST /hability
  def create
    @hability = Hability.new(hability_params)
    if @hability.save
      render json: @hability, methods: [:image_url], status: :created
    else
      render json: { errors: @hability.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/hability/[:id]

  def update
    @hability = Hability.find_by(id: params[:id])
    if @hability.update(hability_params)
      render json: @current_hability, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  def destroy
    @hability = Hability.find_by(id: params[:id]).destroy
    if @hability
      render json: { Message: "Delete hability" }, status: :ok
    else
      render json: { errors: "Not found" }, status: :not_found
    end
  end

  private

  def hability_params
    params.permit(:hability, :body, :image)
  end
end
