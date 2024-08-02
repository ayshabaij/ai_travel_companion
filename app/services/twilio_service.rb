require 'twilio-ruby'

class TwilioService
  def initialize
    puts ENV
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_verification_code(phone_number, code)
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: phone_number,
      body: "Your verification code is: #{code}"
    )
  end
end