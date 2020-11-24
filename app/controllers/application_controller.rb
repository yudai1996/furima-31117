class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters #deviseでのストロングパラメータの追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name_hira, :first_name_hira, :last_name_kata, :first_name_kata, :day_of_birthday])
  end

end