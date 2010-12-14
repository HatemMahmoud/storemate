class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale, :authenticate_user!
  check_authorization
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message 
  end
  
  private
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      case resource_or_scope.role
        when 'admin'
          companies_path
        when 'company_manager'
          company_path current_user.store.company_id
        when 'store_manager'
          store_path current_user.store_id
        when 'cashier'
          store_path current_user.store_id
        else
          super
      end
    else
      super
    end
  end

  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = params[:locale]
  end
end