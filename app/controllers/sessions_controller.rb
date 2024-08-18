# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  rescue StandardError
    flash.now[:error] = "The password does not match the email address."
    render :new
  end
end
