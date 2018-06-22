class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to main_app.root_url, alert: exception.message
    Rails.logger.debug "Access Denied: #{exception.message}"
    flash[:alert] = exception.message
    redirect_to root_url
  end

end
