require 'test_helper'

class UnitTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_unit_type
    assert_difference('UnitType.count') do
      post :create, :unit_type => { }
    end

    assert_redirected_to unit_type_path(assigns(:unit_type))
  end

  def test_should_show_unit_type
    get :show, :id => unit_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => unit_types(:one).id
    assert_response :success
  end

  def test_should_update_unit_type
    put :update, :id => unit_types(:one).id, :unit_type => { }
    assert_redirected_to unit_type_path(assigns(:unit_type))
  end

  def test_should_destroy_unit_type
    assert_difference('UnitType.count', -1) do
      delete :destroy, :id => unit_types(:one).id
    end

    assert_redirected_to unit_types_path
  end
end
