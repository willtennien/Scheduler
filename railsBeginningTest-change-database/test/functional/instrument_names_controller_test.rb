require 'test_helper'

class InstrumentNamesControllerTest < ActionController::TestCase
  setup do
    @instrument_name = instrument_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instrument_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instrument_name" do
    assert_difference('InstrumentName.count') do
      post :create, instrument_name: {  }
    end

    assert_redirected_to instrument_name_path(assigns(:instrument_name))
  end

  test "should show instrument_name" do
    get :show, id: @instrument_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instrument_name
    assert_response :success
  end

  test "should update instrument_name" do
    put :update, id: @instrument_name, instrument_name: {  }
    assert_redirected_to instrument_name_path(assigns(:instrument_name))
  end

  test "should destroy instrument_name" do
    assert_difference('InstrumentName.count', -1) do
      delete :destroy, id: @instrument_name
    end

    assert_redirected_to instrument_names_path
  end
end
