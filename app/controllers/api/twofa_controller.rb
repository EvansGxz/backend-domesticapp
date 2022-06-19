# frozen_string_literal: true

module Api
  class TwofaController < ApplicationController
    skip_before_action :require_login!, only: :create
    def sms
      user = User.find_by(email: session[:email])

      unless user
        render json: { err: "Email no encontrado" },
               status: :internal_server_error and return
      end

      response = Authy::API.request_sms(id: user.authy_id)

      unless response.ok?
        render json: { err: "Error requesting SMS token" },
               status: :internal_server_error and return
      end

      render json: response, status: :ok
    end

    def verify
      user = User.find_by(email: session[:email])

      unless user
        render json: { err: "Email no encontrado" },
               status: :internal_server_error and return
      end

      response = Authy::API.verify(id: user.authy_id, token: params[:token])

      unless response.ok?
        render json: { err: "Verify Token Error" },
               status: :internal_server_error and return
      end

      session[:authy] = true
      render json: response, status: :ok
    end

    def onetouchstatus
      user = User.find_by(email: session[:email])

      render json: { err: "email Not Found" }, status: :internal_server_error and return unless user

      status = Authy::OneTouch.approval_request_status({ uuid: session[:uuid] })

      unless status.ok?
        render json: { err: "One Touch Status Error" },
               status: :internal_server_error and return
      end

      if status["approval_request"]["approval_request"] == "approved"
        session.delete(:uuid) || session.delete("uuid")
        session[:authy] = true
      end

      render json: { body: status }, status: :ok
    end

    def onetouch
      user = User.find_by(email: session[:email])

      render json: { err: "email Not Found" }, status: :internal_server_error and return unless user

      one_touch = Authy::OneTouch.send_approval_request(
        id: user.authy_id,
        message: "Login requested for Account Security account.",
        details: {
          AuthyID: user.authy_id,
          Email: user.email,
          Location: "San Francisco, CA",
          Reason: "Demo by Account Security"
        },
        hidden_details: { test: "This is a" }
      )

      unless one_touch.ok?
        render json: { err: "Create Push Error" },
               status: :internal_server_error and return
      end

      session[:uuid] = one_touch.approval_request["uuid"]

      render json: one_touch, status: :ok
    end
  end
end
