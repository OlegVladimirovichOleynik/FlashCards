class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery with: :exception

  def not_authenticated
    redirect_to login_url, alert: "First login to access this page."
  end

  def default_url_options(options = {})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  def set_locale
    locale = if current_user then current_user.locale
             elsif params[:locale] then session[:locale] = params[:locale]
             elsif session[:locale] then session[:locale]
             else
               http_accept_language.compatible_language_from(I18n.available_locales)
             end
    if locale && I18n.available_locales.include?(locale.to_sym)
      session[:locale] = I18n.locale = locale.to_sym
    end
  end
end
