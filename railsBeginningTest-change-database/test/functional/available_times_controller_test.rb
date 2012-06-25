require 'test_helper'

class AvailableTimesControllerTest < ActionController::TestCase
  setup do
    @available_time = available_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:available_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create available_time" do
    assert_difference('AvailableTime.count') do
      post :create, available_time: {  }
    end

    assert_redirected_to available_time_path(assigns(:available_time))
  end

  test "should show available_time" do
    get :show, id: @available_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @available_time
    assert_response :success
  end

  test "should update available_time" do
    put :update, id: @available_time, available_time: {  }
    assert_redirected_to available_time_path(assigns(:available_time))
  end

  test "should destroy available_time" do
    assert_difference('AvailableTime.count', -1) do
      delete :destroy, id: @available_time
    end

    assert_redirected_to available_times_path
  end
end
