require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  setup do
    @survey = surveys(:about_me)
    @user = users(:survey)
  end

  test "should get index" do
    login(@user)
    get :index
    assert_response :success
    assert_not_nil assigns(:surveys)
  end

  test "should show survey" do
    login(@user)
    get :show, id: @survey
    assert_response :success
  end
end
