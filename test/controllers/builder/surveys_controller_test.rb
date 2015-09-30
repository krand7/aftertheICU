require 'test_helper'

class Builder::SurveysControllerTest < ActionController::TestCase
setup do
    @builder = users(:survey_builder)
    @user = users(:survey)
    @survey = surveys(:about_me)
  end

  test "should get index as builder" do
    login(@builder)
    get :index
    assert_response :success
  end

  test "should not get index as regular user" do
    login(@user)
    get :index
    assert_redirected_to root_path
  end

  test "should get new as builder" do
    login(@builder)
    get :new
    assert_not_nil assigns(:survey)
    assert_response :success
  end

  test "should not get new as regular user" do
    login(@user)
    get :new
    assert_nil assigns(:survey)
    assert_redirected_to root_path
  end

  test "should create survey as builder" do
    login(@builder)
    assert_difference('Survey.count') do
      post :create, survey: { name: 'My New Survey', slug: 'my-new-survey', status: 'show' }
    end
    assert_not_nil assigns(:survey)
    assert_equal 'My New Survey', assigns(:survey).name
    assert_equal 'my-new-survey', assigns(:survey).slug
    assert_equal 'show', assigns(:survey).status
    assert_redirected_to builder_survey_path(id: assigns(:survey))
  end

  test "should not create survey without name" do
    login(@builder)
    assert_difference('Survey.count', 0) do
      post :create, survey: { name: '', slug: 'my-new-survey', status: 'show' }
    end
    assert_not_nil assigns(:survey)
    assert assigns(:survey).errors.size > 0
    assert_equal ["can't be blank"], assigns(:survey).errors[:name]
    assert_template 'new'
    assert_response :success
  end

  test "should not create survey as regular user" do
    login(@user)
    assert_difference('Survey.count', 0) do
      post :create, survey: { name: 'My New Survey', slug: 'my-new-survey', status: 'show' }
    end
    assert_nil assigns(:survey)
    assert_redirected_to root_path
  end

  test "should show survey as builder" do
    login(@builder)
    get :show, id: @survey
    assert_not_nil assigns(:survey)
    assert_response :success
  end

  test "should not show survey as regular user" do
    login(@user)
    get :show, id: @survey
    assert_nil assigns(:survey)
    assert_redirected_to root_path
  end

  test "should get edit survey as builder" do
    login(@builder)
    get :edit, id: @survey
    assert_not_nil assigns(:survey)
    assert_response :success
  end

  test "should not get edit survey as regular user" do
    login(@user)
    get :edit, id: @survey
    assert_nil assigns(:survey)
    assert_redirected_to root_path
  end

  test "should update survey as builder" do
    login(@builder)
    patch :update, id: @survey, survey: { name: 'Updated Survey', slug: 'updated-survey', status: 'hide' }
    assert_not_nil assigns(:survey)
    assert_equal 'Updated Survey', assigns(:survey).name
    assert_equal 'updated-survey', assigns(:survey).slug
    assert_equal 'hide', assigns(:survey).status
    assert_redirected_to builder_survey_path(id: assigns(:survey))
  end

  test "should not update survey without name" do
    login(@builder)
    patch :update, id: @survey, survey: { name: '', slug: 'updated-survey', status: 'hide' }
    assert_not_nil assigns(:survey)
    assert assigns(:survey).errors.size > 0
    assert_equal ["can't be blank"], assigns(:survey).errors[:name]
    assert_template 'edit'
    assert_response :success
  end

  test "should not update survey as regular user" do
    login(@user)
    patch :update, id: @survey, survey: { name: 'Updated Survey', slug: 'updated-survey', status: 'hide' }
    assert_nil assigns(:survey)
    assert_redirected_to root_path
  end

  test "should destroy survey as builder" do
    login(@builder)
    assert_difference('Survey.current.count', -1) do
      delete :destroy, id: @survey
    end
    assert_not_nil assigns(:survey)
    assert_redirected_to builder_surveys_path
  end

  test "should not destroy survey as regular user" do
    login(@user)
    assert_difference('Survey.current.count', 0) do
      delete :destroy, id: @survey
    end
    assert_nil assigns(:survey)
    assert_redirected_to root_path
  end

end
