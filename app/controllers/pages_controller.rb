class PagesController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def chatbot
    # Renders the chatbot view
  end

  def submit_chat
    user_message = params[:message]
    puts "User Message: #{user_message}"

    uri = URI.parse('https://api.upstage.ai/v1/solar/chat/completions')
    request = Net::HTTP::Post.new(uri)
    request.content_type = 'application/json'
    request['Authorization'] = ''
    request.body = {
      model: 'solar-1-mini-chat',
      messages: [
        { role: 'system', content: 'You are a helpful assistant.' },
        { role: 'user', content: user_message }
      ]
    }.to_json

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    puts "Response Code: #{response.code}"
    puts "Response Body: #{response.body}"

    json_response = JSON.parse(response.body)
    bot_reply = json_response['choices'][0]['message']['content'] if json_response['choices']

    render json: { reply: bot_reply }
  end
end
