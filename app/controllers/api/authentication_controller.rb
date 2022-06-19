# frozen_string_literal: true

module Api
  class AuthenticationController < ApplicationController
    before_action :require_login!
    def login
      user = User.find_by(email: params[:email])

      err = "email Not Found" unless user

      err = "Wrong Password" if params[:password] && user && params[:password] != user.password

      render json: { err: err }, status: :unauthorized and return if err

      reset_session
      session[:email] = user.email
      session[:logged_in] = true
      session[:authy] = false
      session[:ph_verified] = false

      data = {
        loggedIn: true,
        email: user.email,
        msg: "Authenticated as: #{user.email}",
        authy: false,
        ph_verified: false
      }

      render json: { session: data }, status: :ok
    end

    def logout
      reset_session
      head :ok
    end

    def logedIn
      url = "/protected"

      url = "/login" unless session[:logged_in]

      url = "/2fa" unless session[:authy]

      render json: { url: url }, status: :ok
    end
  end
end
