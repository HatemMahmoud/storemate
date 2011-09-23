class HelpController < ApplicationController  
  def authorized?
    logged_in? || first_run?
  end
end
