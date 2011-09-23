class HomeController < ApplicationController
  def authorized?
    logged_in? || first_run?
  end
end
