require 'test_helper'

class ForumsControllerTest < ActionController::TestCase
  setup do
    @forum = forums(:one)
    @user = users(:regular)
    @admin = users(:system_admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forums)
  end

  test "should get new as admin" do
    login(@admin)
    get :new
    assert_response :success
  end

  test "should not get new as non-admin" do
    get :new
    assert_response :redirect

    login(@user)
    get :new
    assert_response :redirect
  end

  test "should create forum as admin" do
    login(@admin)
    assert_difference('Forum.count') do
      post :create, forum: { name: 'General' }
    end

    assert_redirected_to forum_path(assigns(:forum))
  end

  test "should not create forum as non-admin" do
    assert_no_difference('Forum.count') do
      post :create, forum: { name: 'General' }
    end
    assert_response :redirect

    login(@user)
    assert_no_difference('Forum.count') do
      post :create, forum: { name: 'General' }
    end
    assert_response :redirect
  end

  test "should show forum" do
    get :show, id: @forum
    assert_response :success
  end

  test "should get edit as admin" do
    login(@admin)
    get :edit, id: @forum
    assert_response :success
  end

  test "should not get edit as non-admin" do
    get :edit, id: @forum
    assert_response :redirect

    login(@user)
    get :edit, id: @forum
    assert_response :redirect
  end

  test "should update forum as admin" do
    login(@admin)
    patch :update, id: @forum, forum: { name: 'Information' }
    assert_equal assigns(:forum).name, 'Information'
    assert_redirected_to forum_path(assigns(:forum))
  end

  test "should not update forum as non-admin" do
    patch :update, id: @forum, forum: { name: 'Information' }
    assert_nil assigns(:forum)

    login(@user)
    patch :update, id: @forum, forum: { name: 'Information' }
    assert_nil assigns(:forum)
  end

  test "should destroy forum as admin" do
    login(@admin)
    assert_difference('Forum.current.count', -1) do
      delete :destroy, id: @forum
    end

    assert_redirected_to forums_path
  end

  test "should not destroy forum as non-admin" do
    assert_no_difference('Forum.current.count') do
      delete :destroy, id: @forum
    end

    login(@user)
    assert_no_difference('Forum.current.count') do
      delete :destroy, id: @forum
    end
  end
end
