# frozen_string_literal: true

class TwilioMessenger
  attr_reader :message

  TWILIO_ACCOUNT_SID = ENV.fetch('TWILIO_ACCOUNT_SID')
  TWILIO_AUTH_TOKEN = ENV.fetch('TWILIO_AUTH_TOKEN')

  def initialize(message, phone_number)
    @message = message
    @phone_number = phone_number
  end

  def call
    client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

    client.account.messages.create(
      from: ENV.fetch('TWILIO_PHONE_NUMBER'),
      to: "+#{@phone_number}",
      body: message
    )
  end
end
