# frozen_string_literal: true

# This class handle verify process with twi
module Api
  class VerifyController < ApplicationController
    skip_before_action :require_login!, only: %i[start verify message]
    before_action :set_twilio_client, only: %i[start verify message]

    def start
      phone_number = params[:phone]
      user = User.find_by(phone: phone_number)
      via = params[:via]
      lada = params[:lada]
      if !phone_number || !via
        render json: { err: "Missing fields" },
               status: :internal_server_error and return
      end

      if user
        verification = start_verification(lada+phone_number, via)

        unless verification.sid
          render json: { err: "Error delivering code verification" },
                 status: :internal_server_error and return
        end

        render json: { sid: verification.sid }, status: :ok
      else
        render json: { errors: "Celular no encontrado" }, status: :not_found
      end
    end

    def message
      
      require 'rubygems' 
      require 'twilio-ruby' 
       
      

      phone = params[:phone]
      lada = params[:lada]
      service = params[:service]
      @client.messages.create( 
                                   body: "Nuevo Servicio Programado de #{service}",
                                   from: "whatsapp:+18445052797",
                                   to: "whatsapp:#{lada}1#{phone}"
                                 ) 
    end


    def verify
      phone_number = params[:phone]
      token = params[:token]

      if !phone_number || !token
        render json: { err: "Missing fields" },
               status: :internal_server_error and return
      end

      response = check_verification(phone_number, token)

      unless response.status
        Rails.logger.debug { "Error creating phone reg request, #{err}" }
        render json: { err: "Verify Token Error" }, status: :internal_server_error and return
      end

      if response.status != "approved"
        render json: { err: "Codigo invalido" },
               status: :unauthorized and return
      end

      session[:authy] = true
      render json: { status: response.status }, status: :ok
    end

    private

    def set_twilio_client
      account_sid = "ACe0f9a419f2c4afdaeb89fbc487c16c3e"
      auth_token = "42facc3d561f9d0dc5484fafa043adce"
      @client = Twilio::REST::Client.new(account_sid, auth_token)
    end

    def start_verification(to, channel = "whatsapp")
      @client.verify.services(ENV.fetch("VERIFY_SERVICE_SID", nil))
                            .verifications
                            .create(to: to, channel: channel)
    end

    def check_verification(phone, code)
      @client.verify.services(ENV.fetch("VERIFY_SERVICE_SID", nil))
                                  .verification_checks
                                  .create(to: phone, code: code)
    end
  end
end
