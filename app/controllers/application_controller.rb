class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters #deviseでのストロングパラメータの追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name_hira, :first_name_hira, :family_name_kata, :first_name_kata, :day_of_birthday])
  end

end