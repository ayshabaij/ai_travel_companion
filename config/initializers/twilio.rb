Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID']
  config.auth_token = ENV['TWILIO_AUTH_TOKEN']
end

@client = Twilio::REST::Client.new

def send_verification_code(user_phone_number, verification_code)
  @client.messages.create(
    from: ENV['TWILIO_PHONE_NUMBER'],
    to: user_phone_number,
    body: "Your verification code is #{verification_code}"
  )
end
