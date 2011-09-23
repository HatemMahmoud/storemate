require 'test_helper'

class SalesOrdersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_orders)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_sales_order
    assert_difference('SalesOrder.count') do
      post :create, :sales_order => { }
    end

    assert_redirected_to sales_order_path(assigns(:sales_order))
  end

  def test_should_show_sales_order
    get :show, :id => sales_orders(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => sales_orders(:one).id
    assert_response :success
  end

  def test_should_update_sales_order
    put :update, :id => sales_orders(:one).id, :sales_order => { }
    assert_redirected_to sales_order_path(assigns(:sales_order))
  end

  def test_should_destroy_sales_order
    assert_difference('SalesOrder.count', -1) do
      delete :destroy, :id => sales_orders(:one).id
    end

    assert_redirected_to sales_orders_path
  end
end
