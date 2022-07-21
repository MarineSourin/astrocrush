class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
        :username,
        :email,
        :password,
        :password_confirmation,
        :description,
        :hobbies,
        :photos,
        :birth_date,
        :birth_hour,
        :birth_location,
        :birth_country,
        :gender,
        :looking_for,
        :star_sign,
        :rising,
        :moon)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(
        :username,
        :email,
        :password,
        :password_confirmation,
        :description,
        :hobbies,
        :photos,
        :birth_date,
        :birth_hour,
        :birth_country,
        :birth_location,
        :gender,
        :looking_for,
        :star_sign,
        :rising,
        :moon
        )}
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
