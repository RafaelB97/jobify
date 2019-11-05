class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # TODO Search why this work with config/routes.rb
  def after_sign_in_path_for(resource)
    # session[:domain_prefix] = current_user.domain_prefix
    # user_path(resource)
    puts "hola mundo"
    puts session[:userType]
    session[:userType] = current_user.userType
    puts current_user.userType
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :birthday, :address, :phone, :userType])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:userType])
  end
  
end
