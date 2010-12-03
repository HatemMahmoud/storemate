class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_authorization_check
  
  def show
    render params[:id].to_s.downcase
  end
end