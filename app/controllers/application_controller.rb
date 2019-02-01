class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :city_id])
  end
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :cleaner
      new_cleaner_session_path
    else
      root_path
    end
  end
end
