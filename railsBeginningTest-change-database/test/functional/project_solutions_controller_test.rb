require 'test_helper'

class ProjectSolutionsControllerTest < ActionController::TestCase
  setup do
    @project_solution = project_solutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_solutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_solution" do
    assert_difference('ProjectSolution.count') do
      post :create, project_solution: {  }
    end

    assert_redirected_to project_solution_path(assigns(:project_solution))
  end

  test "should show project_solution" do
    get :show, id: @project_solution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_solution
    assert_response :success
  end

  test "should update project_solution" do
    put :update, id: @project_solution, project_solution: {  }
    assert_redirected_to project_solution_path(assigns(:project_solution))
  end

  test "should destroy project_solution" do
    assert_difference('ProjectSolution.count', -1) do
      delete :destroy, id: @project_solution
    end

    assert_redirected_to project_solutions_path
  end
end
