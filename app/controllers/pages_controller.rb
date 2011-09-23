class PagesController < ApplicationController
  def show
    render params[:id].to_s.downcase
  end
end
