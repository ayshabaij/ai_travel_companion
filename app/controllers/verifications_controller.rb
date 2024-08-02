# app/controllers/verifications_controller.rb
class VerificationsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    current_user.update(phone_number: params[:phone_number], verification_code: generate_code)
    TwilioService.new.send_verification_code(current_user.phone_number, current_user.verification_code)
    redirect_to verify_verification_path
  end

  def verify
  end

  def confirm
    if params[:verification_code] == current_user.verification_code
      current_user.update(verification_code: nil)
      redirect_to root_path, notice: 'Phone number verified successfully!'
    else
      flash[:alert] = 'Invalid verification code. Please try again.'
      render :verify
    end
  end

  private

  def generate_code
    rand(100000..999999).to_s
  end
end
