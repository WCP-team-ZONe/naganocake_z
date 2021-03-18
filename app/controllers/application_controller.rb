class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_kana, :first_kana, :postal_code, :address, :phone_number, :is_deleted])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  # 消費税
  def set_tax
    @tax = 1.1
  end
end
