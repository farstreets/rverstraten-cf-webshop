class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to main_app.root_url, alert: exception.message
    Rails.logger.debug "Access Denied: #{exception.message}"
    flash[:alert] = exception.message
    redirect_to root_url
  end

  # https://github.com/ryanb/cancan/issues/238

  # I just realized the error: the root action was redirecting authenticated users to a different action (and so losing the flash). My mistake.

end
