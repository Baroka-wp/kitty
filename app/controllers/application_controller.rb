class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart


  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception, prepend: true

  DEVISE_SIGN_UP_FIELDS = %i[ email password password_confirmation]
  DEVISE_UPDATE_FIELDS = %i[ email current_password]



  def after_sign_out_path_for(user)
    root_path
  end

  def after_sign_in_path_for(user)
    if current_user.profil.present?
      root_path
    else
      new_profil_path
    end
  end

  def check_if_user_profil_present!
    if current_user.profil.nil?
      redirect_to new_profil_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(DEVISE_SIGN_UP_FIELDS)}
    devise_parameter_sanitizer.permit(:user_update) { |u| u.permit(DEVISE_UPDATE_FIELDS)}
  end
end
