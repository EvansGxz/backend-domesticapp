require "twilio-ruby"

class TwilioClient
  attr_reader :client

  def initialize
    account_sid = "ACe0f9a419f2c4afdaeb89fbc487c16c3e"
    auth_token = "9a4ad22f95615aec2cbe9a4d66f56098"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text
    message = @client.messages
                     .create(
                       body: "Hola a todos",
                       from: "whatsapp:+14155238886",
                       to: "whatsapp:+5218994466683"
                     )
    Rails.logger.debug message
    Rails.logger.debug "holas"
  end
end
