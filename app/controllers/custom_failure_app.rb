class CustomFailureApp < Devise::FailureApp
  include Rails.application.routes.url_helpers # Include route helpers

  def redirect_url
    if warden_options[:scope] == :user
      unauthenticated_root_path # Redirect to root path instead of sign-in
    else
      super
    end
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
