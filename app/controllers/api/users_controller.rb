# frozen_string_literal: true

require "authy"

module Api
  class UsersController < ApplicationController
    skip_before_action :require_login!, only: :create
    def register
      redirect_to "/" if session[:user_id]

      if User.find_by(email: params[:email])
        render json: { err: "Este usario ya existe" }, status: :conflict and return
      end

      authy = Authy::API.register_user(
        email: params[:email],
        phone: params[:phone],
        country_code: params[:country_code]
      )

      unless authy.ok?
        error_msg = "One attribute is not valid, would you mind to take a look at them?"
        logger.warn error_msg
        render json: { err: error_msg }, status: :internal_server_error and return
      end

      new_user = User.create(
        email: params[:email],
        phone: params[:phone],
        authy_id: authy.id,
        password: params[:password]
      )

      unless new_user
        logger.warn e.to_s
        render json: { error: e.to_s }, status: :internal_server_error and return
      end

      session[:email] = new_user.email
      session[:logged_in] = true
      render json: {}, status: :ok
    end

    def index
      @user = User.all

      render json: @user, status: :ok
    end
  end
end
