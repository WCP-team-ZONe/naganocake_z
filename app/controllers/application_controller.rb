class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

      #サインイン後の遷移パス
  def after_sign_in_path_for(resource)
    if member_signed_in?
      root_path
    else
      private_orders_path
    end
  end
  
      #サインアップ後の遷移パス
  def after_sign_up_path(resource)
    if meber_sined_up?
      member_path(current_member)
    else
      private_orders_path
    end
  end
  
      #サインアウト後の遷移
  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_kana, :first_kana, :postal_code, :address, :phone_number, :is_deleted])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
