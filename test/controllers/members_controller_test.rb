require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @user = users(:social)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, forum_name: @user.forum_name
    assert_response :success
  end

  test "should get leaderboards" do
    get :leaderboards
    assert_response :success
  end

end
