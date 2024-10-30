class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Разрешаем параметр `admin` при регистрации пользователя
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
    
    # Разрешаем параметр `admin` при обновлении профиля пользователя
    devise_parameter_sanitizer.permit(:account_update, keys: [:admin])
  end

  def coming_soon
    render template: 'layouts/coming_soon'
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: 'У вас нет прав для выполнения этого действия.'
  end
end
