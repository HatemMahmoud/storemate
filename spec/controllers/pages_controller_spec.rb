require 'spec_helper'

describe PagesController do

  describe "GET 'show', :id => 'home'" do
    it "should be successful" do
      get 'show', :id => 'home'
      response.should be_success
    end
  end

  describe "GET 'show', :id => 'help'" do
    it "should be successful" do
      get 'show', :id => 'help'
      response.should be_success
    end
  end

end
