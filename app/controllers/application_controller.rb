class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :username, :email, :password, :password_confirmation)
    end
  end
end
