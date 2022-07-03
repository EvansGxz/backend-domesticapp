# frozen_string_literal: true

# This class handle verify process with twi
module Api
  class VerifyController < ApplicationController
    skip_before_action :require_login!, only: %i[start verify create_services edit_services cancel_services]
    before_action :set_twilio_client, only: %i[start verify create_services edit_services cancel_services]

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

    def create_services

      phone = params[:phone]
      lada = params[:lada]
      service = params[:service]
      day = params[:day]
      service_time = params[:service_time]
      finish_hour = params[:finish_hour]
      customer = params[:customer]
      address = params[:address]
      employee = params[:employee]

      body_message =
        "*¡Tenemos un nuevo servicio programado en Domesticapp!:*\n\n"\
        "Prestaremos el servicio de *#{service}* el día *#{day}* en las "\
        "horas *#{service_time} - #{finish_hour}* a *#{customer}* en *#{address}* por parte de *#{employee}*.\n\n"\
        "Verifica que todo se encuentre en orden. Un saludo - _El equipo Domesticapp_\n\n"\
        "(Este es un mensaje de notificación automático, evite responderlo)"

      @client.messages.create(from: "whatsapp:+18445052797",
                              media_url: ['https://domesticapp-storage.s3.us-east-2.amazonaws.com/notifications/1.png'],
                              body: body_message,
                              to: "whatsapp:#{lada}1#{phone}"
                            )
    end

    def edit_services

      phone = params[:phone]
      lada = params[:lada]
      service = params[:service]
      day = params[:day]
      service_time = params[:service_time]
      finish_hour = params[:finish_hour]
      customer = params[:customer]
      address = params[:address]
      employee = params[:employee]

      body_message =
        "*¡Ups! Ha habido un cambio en un servicio programado en Domesticapp. "\
        "Revisa la nueva información a continuación:*\n\n"\
        "Prestaremos el servicio de *#{service}* el día *#{day}* en las "\
        "horas *#{service_time} - #{finish_hour}* a *#{customer}* en *#{address}* por parte de *#{employee}*.\n\n"\
        "Verifica que todo se encuentre en orden. Un saludo - _El equipo Domesticapp_\n\n"\
        "(Este es un mensaje de notificación automático, evite responderlo)"

      @client.messages.create(from: "whatsapp:+18445052797",
                              media_url: ['https://domesticapp-storage.s3.us-east-2.amazonaws.com/notifications/2.png'],
                              body: body_message,
                              to: "whatsapp:#{lada}1#{phone}"
                            )
    end

    def cancel_services

      phone = params[:phone]
      lada = params[:lada]
      service = params[:service]
      day = params[:day]
      service_time = params[:service_time]
      finish_hour = params[:finish_hour]
      customer = params[:customer]
      address = params[:address]
      employee = params[:employee]

      body_message =
        "¡Ups! Ha habido un problema en un servicio programado en Domesticapp y por tal "\
        "razón este se ha *cancelado*. Revisa la nueva información a continuación:\n\n"\
        "El servicio cancelado es *#{service}* el día *#{day}* en las "\
        "horas *#{service_time} - #{finish_hour}* a *#{customer}* en *#{address}* por parte de *#{employee}*.\n\n"\
        "Verifica que todo se encuentre en orden. Un saludo - _El equipo Domesticapp_\n\n"\
        "(Este es un mensaje de notificación automático, evite responderlo)"

      @client.messages.create(from: "whatsapp:+18445052797",
                              media_url: ['https://domesticapp-storage.s3.us-east-2.amazonaws.com/notifications/3.png'],
                              body: body_message,
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
      auth_token = "07352bcb0fd95522a195b43ac26bf8a6"
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
