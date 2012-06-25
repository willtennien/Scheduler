require 'test_helper'

class ProjectRequirementsControllerTest < ActionController::TestCase
  setup do
    @project_requirement = project_requirements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_requirements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_requirement" do
    assert_difference('ProjectRequirement.count') do
      post :create, project_requirement: {  }
    end

    assert_redirected_to project_requirement_path(assigns(:project_requirement))
  end

  test "should show project_requirement" do
    get :show, id: @project_requirement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_requirement
    assert_response :success
  end

  test "should update project_requirement" do
    put :update, id: @project_requirement, project_requirement: {  }
    assert_redirected_to project_requirement_path(assigns(:project_requirement))
  end

  test "should destroy project_requirement" do
    assert_difference('ProjectRequirement.count', -1) do
      delete :destroy, id: @project_requirement
    end

    assert_redirected_to project_requirements_path
  end
end
