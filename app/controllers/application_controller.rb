class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!

  protect_from_forgery
  def after_sign_in_path_for(admin)
    authenticated_root_path
  end
end
