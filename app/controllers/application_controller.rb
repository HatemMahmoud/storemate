class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale, :authenticate_user!
  
  check_authorization
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message 
  end
  
  private
    
  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = params[:locale]
  end
end
