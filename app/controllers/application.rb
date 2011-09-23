# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  include AuthenticatedSystem
  before_filter :login_required
  helper_method :mystore, :first_run?
  
  def mystore
    Store.find :first
  end
  
  def first_run?
    User.count == 0
  end
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '0120e825045522dc907db7509d3cbd32'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
