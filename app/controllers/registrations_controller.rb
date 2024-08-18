class RegistrationsController < Devise::RegistrationsController
  def check_email
    email_exists = User.exists?(email: params[:email])
    render json: { isUnique: !email_exists }
  end
end
