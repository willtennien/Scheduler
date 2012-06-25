require 'test_helper'

class SoundproofnessesControllerTest < ActionController::TestCase
  setup do
    @soundproofness = soundproofnesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soundproofnesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soundproofness" do
    assert_difference('Soundproofness.count') do
      post :create, soundproofness: {  }
    end

    assert_redirected_to soundproofness_path(assigns(:soundproofness))
  end

  test "should show soundproofness" do
    get :show, id: @soundproofness
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soundproofness
    assert_response :success
  end

  test "should update soundproofness" do
    put :update, id: @soundproofness, soundproofness: {  }
    assert_redirected_to soundproofness_path(assigns(:soundproofness))
  end

  test "should destroy soundproofness" do
    assert_difference('Soundproofness.count', -1) do
      delete :destroy, id: @soundproofness
    end

    assert_redirected_to soundproofnesses_path
  end
end
