class RegistrationsController < Devise::RegistrationsController
  # POST /check_email
  def check_email
    email_exists = User.exists?(email: params[:email])
    render json: { isUnique: !email_exists }
  end
end
