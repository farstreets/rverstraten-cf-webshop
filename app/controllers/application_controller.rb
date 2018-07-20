class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to main_app.root_url, alert: exception.message
    Rails.logger.debug "Access Denied: #{exception.message}"
    flash[:alert] = exception.message
    redirect_to root_url
  end

  # Example for adding custom fields to devise...
  # https://gist.github.com/withoutwax/46a05861aa4750384df971b641170407

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
    end

end
