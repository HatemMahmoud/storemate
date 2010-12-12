require "spec_helper"

describe SuppliersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/suppliers" }.should route_to(:controller => "suppliers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/suppliers/new" }.should route_to(:controller => "suppliers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/suppliers/1" }.should route_to(:controller => "suppliers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/suppliers/1/edit" }.should route_to(:controller => "suppliers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/suppliers" }.should route_to(:controller => "suppliers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/suppliers/1" }.should route_to(:controller => "suppliers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/suppliers/1" }.should route_to(:controller => "suppliers", :action => "destroy", :id => "1")
    end

  end
end
