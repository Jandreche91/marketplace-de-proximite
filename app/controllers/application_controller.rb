class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: :home

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :address, :city_name, :city_postcode, :phone_number])

    devise_parameter_sanitizer.permit(:account_update, keys: [:address, :city_name, :city_postcode, :phone_number])
  end
end
