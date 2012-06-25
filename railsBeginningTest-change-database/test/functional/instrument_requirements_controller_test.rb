require 'test_helper'

class InstrumentRequirementsControllerTest < ActionController::TestCase
  setup do
    @instrument_requirement = instrument_requirements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instrument_requirements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instrument_requirement" do
    assert_difference('InstrumentRequirement.count') do
      post :create, instrument_requirement: {  }
    end

    assert_redirected_to instrument_requirement_path(assigns(:instrument_requirement))
  end

  test "should show instrument_requirement" do
    get :show, id: @instrument_requirement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instrument_requirement
    assert_response :success
  end

  test "should update instrument_requirement" do
    put :update, id: @instrument_requirement, instrument_requirement: {  }
    assert_redirected_to instrument_requirement_path(assigns(:instrument_requirement))
  end

  test "should destroy instrument_requirement" do
    assert_difference('InstrumentRequirement.count', -1) do
      delete :destroy, id: @instrument_requirement
    end

    assert_redirected_to instrument_requirements_path
  end
end
