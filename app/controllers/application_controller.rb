class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to articles_url, :alert => exception.message
  end

  protected
  	def configure_devise_permitted_parameters 
  		 devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	 user_params.permit(:password,:email,:first_name,:last_name,:phone_number,:password_confirmation,:avatar,roles: [])
    end
	end
end
