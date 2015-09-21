require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test "should get dashboard for regular user" do
    login(users(:regular))
    get :dashboard
    assert_response :success
  end

  test "should not get dashboard for logged out user" do
    get :dashboard
    assert_redirected_to new_user_session_path
  end

  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get version" do
    get :version
    assert_response :success
  end

  test "should get version as json" do
    get :version, format: 'json'
    version = JSON.parse(response.body)
    assert_equal AftertheICU::VERSION::STRING, version['version']['string']
    assert_equal AftertheICU::VERSION::MAJOR, version['version']['major']
    assert_equal AftertheICU::VERSION::MINOR, version['version']['minor']
    assert_equal AftertheICU::VERSION::TINY, version['version']['tiny']
    assert_equal AftertheICU::VERSION::BUILD, version['version']['build']
    assert_response :success
  end
end
