class UserMailer < ApplicationMailer
  def reset_password_instructions
    @user = params[:user]
    mail(to: @user.email, subject: 'Reset Your Password')
  end
end
