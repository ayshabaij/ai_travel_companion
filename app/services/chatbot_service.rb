class ChatbotService
  require 'httparty'


  API_KEY = ENV['UPSTAGE_API_KEY']
  BASE_URL = 'https://api.upstage.ai/v1/solar'

  def initialize
    @system_prompt = {
      "role" => "system",
      "content" => "You are a knowledgeable assistant who specializes in answering questions about tourism in South Korea. Only provide information related to South Korea and ignore any other topics."
    }
    @chat_history = []
    @history_size = 10
  end

  def chat(user_message)
    @chat_history << { "role" => "user", "content" => user_message }
    messages = [@system_prompt] + @chat_history

    bot_reply = ""
    HTTParty.post(
      "#{BASE_URL}/chat/completions",
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{API_KEY}"
      },
      body: {
        model: 'solar-1-mini-chat',
        messages: messages,
        stream: true
      }.to_json
    ) do |chunk|
      # Extract the JSON part from the chunk
      chunk_data_raw = chunk.gsub(/^data: /, '')

      begin
        chunk_data = JSON.parse(chunk_data_raw)
        delta_content = chunk_data.dig("choices", 0, "delta", "content")
        bot_reply += delta_content if delta_content
      rescue JSON::ParserError => e
        # Handle the case where the chunk is not valid JSON
        puts "Failed to parse chunk: #{chunk_data_raw}"
      end
    end

    # Verify if the response is related to South Korea
    if bot_reply.downcase.include?('korea') || bot_reply.downcase.include?('seoul') || bot_reply.downcase.include?('busan') # Add more keywords as needed
      # Append bot response to the chat history
      @chat_history << { "role" => "assistant", "content" => bot_reply }
    else
      bot_reply = "Sorry, I can only provide information related to tourism in South Korea."
      @chat_history << { "role" => "assistant", "content" => bot_reply }
    end

    # Ensure the chat history doesn't exceed the size limit
    @chat_history = @chat_history.last(@history_size)

    bot_reply
  end
end
