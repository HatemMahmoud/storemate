require 'test_helper'

class TaxRatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tax_rates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tax_rate
    assert_difference('TaxRate.count') do
      post :create, :tax_rate => { }
    end

    assert_redirected_to tax_rate_path(assigns(:tax_rate))
  end

  def test_should_show_tax_rate
    get :show, :id => tax_rates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tax_rates(:one).id
    assert_response :success
  end

  def test_should_update_tax_rate
    put :update, :id => tax_rates(:one).id, :tax_rate => { }
    assert_redirected_to tax_rate_path(assigns(:tax_rate))
  end

  def test_should_destroy_tax_rate
    assert_difference('TaxRate.count', -1) do
      delete :destroy, :id => tax_rates(:one).id
    end

    assert_redirected_to tax_rates_path
  end
end
