require 'test_helper'

class Builder::QuestionsControllerTest < ActionController::TestCase
  setup do
    @builder = users(:survey_builder)
    @user = users(:regular)
    @survey = surveys(:about_me)
    @question = questions(:how_are_you)
  end

  test "should get questions as builder" do
    login(@builder)
    get :index, survey_id: @survey
    assert_not_nil assigns(:survey)
    assert_redirected_to builder_survey_path(assigns(:survey))
  end

  test "should not get questions as regular user" do
    login(@user)
    get :index, survey_id: @survey
    assert_nil assigns(:survey)
    assert_redirected_to root_path
  end

  test "should get new question as builder" do
    login(@builder)
    get :new, survey_id: @survey
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_response :success
  end

  test "should not get new question as regular user" do
    login(@user)
    get :new, survey_id: @survey
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_redirected_to root_path
  end

  test "should create question as builder" do
    login(@builder)
    assert_difference('Question.count') do
      post :create, survey_id: @survey, question: { title: 'My New Question', slug: 'my-new-question' }
    end
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_equal 'My New Question', assigns(:question).title
    assert_equal 'my-new-question', assigns(:question).slug
    assert_redirected_to builder_question_path(assigns(:question))
  end

  test "should not create question without text" do
    login(@builder)
    assert_difference('Question.count', 0) do
      post :create, survey_id: @survey, question: { title: '', slug: 'my-new-question' }
    end
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert assigns(:question).errors.size > 0
    assert_equal ["can't be blank"], assigns(:question).errors[:title]
    assert_template 'questions/new'
    assert_response :success
  end

  test "should not create question as regular user" do
    login(@user)
    assert_difference('Question.count', 0) do
      post :create, survey_id: @survey, question: { title: 'My New Question', slug: 'my-new-question' }
    end
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_redirected_to root_path
  end

  test "should show question as builder" do
    login(@builder)
    get :show, id: @question
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_response :success
  end

  test "should not show question as regular user" do
    login(@user)
    get :show, id: @question
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_redirected_to root_path
  end

  test "should get edit question as builder" do
    login(@builder)
    get :edit, id: @question
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_response :success
  end

  test "should not get edit question as regular user" do
    login(@user)
    get :edit, id: @question
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_redirected_to root_path
  end

  test "should update question as builder" do
    login(@builder)
    patch :update, id: @question, question: { title: 'Updated Question', slug: 'updated-question' }
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_equal 'Updated Question', assigns(:question).title
    assert_equal 'updated-question', assigns(:question).slug
    assert_redirected_to builder_question_path(assigns(:question))
  end

  test "should not update question without name" do
    login(@builder)
    patch :update, id: @question, question: { title: '', slug: 'updated-question' }
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert assigns(:question).errors.size > 0
    assert_equal ["can't be blank"], assigns(:question).errors[:title]
    assert_template 'questions/edit'
    assert_response :success
  end

  test "should not update question as regular user" do
    login(@user)
    patch :update, id: @question, question: { title: 'Updated Question', slug: 'updated-question' }
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_redirected_to root_path
  end

  test "should destroy question as builder" do
    login(@builder)
    assert_difference('Question.current.count', -1) do
      delete :destroy, id: @question
    end
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_redirected_to builder_survey_path(assigns(:survey))
  end

  test "should not destroy question as regular user" do
    login(@user)
    assert_difference('Question.current.count', 0) do
      delete :destroy, id: @question
    end
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_redirected_to root_path
  end
end
