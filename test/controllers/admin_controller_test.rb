require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  setup do
    @admin = users(:system_admin)
  end

  test "should get dashboard" do
    login(@admin)
    get :dashboard
    assert_response :success
  end

  test "should get users" do
    login(@admin)
    get :users
    assert_response :success
  end

  test "should get user detail" do
    login(@admin)
    get :user_detail, id: @admin
    assert_response :success
  end

  test "should get research topics" do
    login(@admin)
    get :research_topics
    assert_response :success
  end

  test "should not get any pages as regular user" do
    login(users(:regular))
    get :dashboard
    assert_response :redirect
    get :users
    assert_response :redirect
    get :user_detail, id: @admin
    assert_response :redirect
    get :research_topics
    assert_response :redirect
  end
end
