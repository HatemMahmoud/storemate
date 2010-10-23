require 'spec_helper'

describe PagesController do

  describe "GET 'show', :id => 'home'" do
    it "should be successful" do
      get 'show', :id => 'home'
      response.should be_success
    end
  end

end
