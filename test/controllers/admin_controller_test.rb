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

end
