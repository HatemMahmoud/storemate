require 'test_helper'

class SuppliersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:suppliers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_supplier
    assert_difference('Supplier.count') do
      post :create, :supplier => { }
    end

    assert_redirected_to supplier_path(assigns(:supplier))
  end

  def test_should_show_supplier
    get :show, :id => suppliers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => suppliers(:one).id
    assert_response :success
  end

  def test_should_update_supplier
    put :update, :id => suppliers(:one).id, :supplier => { }
    assert_redirected_to supplier_path(assigns(:supplier))
  end

  def test_should_destroy_supplier
    assert_difference('Supplier.count', -1) do
      delete :destroy, :id => suppliers(:one).id
    end

    assert_redirected_to suppliers_path
  end
end
