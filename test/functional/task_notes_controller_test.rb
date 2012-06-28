require 'test_helper'

class TaskNotesControllerTest < ActionController::TestCase
  setup do
    @task_note = task_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_note" do
    assert_difference('TaskNote.count') do
      post :create, task_note: { content: @task_note.content, owner: @task_note.owner, title: @task_note.title, user_id: @task_note.user_id }
    end

    assert_redirected_to task_note_path(assigns(:task_note))
  end

  test "should show task_note" do
    get :show, id: @task_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_note
    assert_response :success
  end

  test "should update task_note" do
    put :update, id: @task_note, task_note: { content: @task_note.content, owner: @task_note.owner, title: @task_note.title, user_id: @task_note.user_id }
    assert_redirected_to task_note_path(assigns(:task_note))
  end

  test "should destroy task_note" do
    assert_difference('TaskNote.count', -1) do
      delete :destroy, id: @task_note
    end

    assert_redirected_to task_notes_path
  end
end
