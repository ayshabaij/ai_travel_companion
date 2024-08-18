class PagesController < ApplicationController
  def chatbot
    # Renders the chatbot view
  end

  def submit_chat
    user_message = params[:message]
    chatbot_service = ChatbotService.new
    bot_reply = chatbot_service.chat(user_message)

    render json: { reply: bot_reply }
  end
end
