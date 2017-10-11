require 'test_helper'

class QueryTasksControllerTest < ActionController::TestCase
  setup do
    @query_task = query_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:query_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create query_task" do
    assert_difference('QueryTask.count') do
      post :create, query_task: { description: @query_task.description, name: @query_task.name, user_id: @query_task.user_id }
    end

    assert_redirected_to query_task_path(assigns(:query_task))
  end

  test "should show query_task" do
    get :show, id: @query_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @query_task
    assert_response :success
  end

  test "should update query_task" do
    patch :update, id: @query_task, query_task: { description: @query_task.description, name: @query_task.name, user_id: @query_task.user_id }
    assert_redirected_to query_task_path(assigns(:query_task))
  end

  test "should destroy query_task" do
    assert_difference('QueryTask.count', -1) do
      delete :destroy, id: @query_task
    end

    assert_redirected_to query_tasks_path
  end
end
