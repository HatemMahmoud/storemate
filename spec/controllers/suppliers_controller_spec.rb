require 'spec_helper'

describe SuppliersController do

  def mock_supplier(stubs={})
    (@mock_supplier ||= mock_model(Supplier).as_null_object).tap do |supplier|
      supplier.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all suppliers as @suppliers" do
      Supplier.stub(:all) { [mock_supplier] }
      get :index
      assigns(:suppliers).should eq([mock_supplier])
    end
  end

  describe "GET show" do
    it "assigns the requested supplier as @supplier" do
      Supplier.stub(:find).with("37") { mock_supplier }
      get :show, :id => "37"
      assigns(:supplier).should be(mock_supplier)
    end
  end

  describe "GET new" do
    it "assigns a new supplier as @supplier" do
      Supplier.stub(:new) { mock_supplier }
      get :new
      assigns(:supplier).should be(mock_supplier)
    end
  end

  describe "GET edit" do
    it "assigns the requested supplier as @supplier" do
      Supplier.stub(:find).with("37") { mock_supplier }
      get :edit, :id => "37"
      assigns(:supplier).should be(mock_supplier)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created supplier as @supplier" do
        Supplier.stub(:new).with({'these' => 'params'}) { mock_supplier(:save => true) }
        post :create, :supplier => {'these' => 'params'}
        assigns(:supplier).should be(mock_supplier)
      end

      it "redirects to the created supplier" do
        Supplier.stub(:new) { mock_supplier(:save => true) }
        post :create, :supplier => {}
        response.should redirect_to(supplier_url(mock_supplier))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved supplier as @supplier" do
        Supplier.stub(:new).with({'these' => 'params'}) { mock_supplier(:save => false) }
        post :create, :supplier => {'these' => 'params'}
        assigns(:supplier).should be(mock_supplier)
      end

      it "re-renders the 'new' template" do
        Supplier.stub(:new) { mock_supplier(:save => false) }
        post :create, :supplier => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested supplier" do
        Supplier.should_receive(:find).with("37") { mock_supplier }
        mock_supplier.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :supplier => {'these' => 'params'}
      end

      it "assigns the requested supplier as @supplier" do
        Supplier.stub(:find) { mock_supplier(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:supplier).should be(mock_supplier)
      end

      it "redirects to the supplier" do
        Supplier.stub(:find) { mock_supplier(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(supplier_url(mock_supplier))
      end
    end

    describe "with invalid params" do
      it "assigns the supplier as @supplier" do
        Supplier.stub(:find) { mock_supplier(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:supplier).should be(mock_supplier)
      end

      it "re-renders the 'edit' template" do
        Supplier.stub(:find) { mock_supplier(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested supplier" do
      Supplier.should_receive(:find).with("37") { mock_supplier }
      mock_supplier.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the suppliers list" do
      Supplier.stub(:find) { mock_supplier }
      delete :destroy, :id => "1"
      response.should redirect_to(suppliers_url)
    end
  end

end
