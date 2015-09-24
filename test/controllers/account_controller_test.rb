require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  setup do
    @user = users(:regular)
  end

  test "should get settings for user" do
    login(@user)
    get :settings
    assert_response :success
  end

end
