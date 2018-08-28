class ApplicationController < ActionController::Base
    
  include SessionsHelper
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!

  protected

  def configure_permitted_parameters

    added_attrs = [ :name, :base, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs    

  end  
  
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case resource
    when User
       user_path(resource)
    when Applicant
       applicant_path(resource)
    end
  end    
  
  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end  

  
end
