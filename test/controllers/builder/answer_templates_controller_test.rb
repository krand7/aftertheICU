require 'test_helper'

class Builder::AnswerTemplatesControllerTest < ActionController::TestCase
  setup do
    @builder = users(:survey_builder)
    @user = users(:regular)
    @survey = surveys(:about_me)
    @question = questions(:how_are_you)
    @answer_template = answer_templates(:how_are_you)
  end

  test "should get answer templates as builder" do
    login(@builder)
    get :index, question_id: @question
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_redirected_to builder_question_path(assigns(:question))
  end

  test "should not get answer templates as regular user" do
    login(@user)
    get :index, question_id: @question
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_redirected_to root_path
  end

  test "should get new answer template as builder" do
    login(@builder)
    get :new, question_id: @question
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_not_nil assigns(:answer_template)
    assert_response :success
  end

  test "should not get new answer template as regular user" do
    login(@user)
    get :new, question_id: @question
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_nil assigns(:answer_template)
    assert_redirected_to root_path
  end

  test "should create answer template as builder" do
    login(@builder)
    assert_difference('AnswerTemplate.count') do
      post :create, question_id: @question.id, answer_template: { name: 'My New Answer Template', template_type: 'checkbox' }
    end
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_not_nil assigns(:answer_template)
    assert_equal 'My New Answer Template', assigns(:answer_template).name
    assert_equal 'checkbox', assigns(:answer_template).template_type
    assert_redirected_to builder_answer_template_path(assigns(:answer_template))
  end

  test "should not create answer template without name" do
    login(@builder)
    assert_difference('AnswerTemplate.count', 0) do
      post :create, question_id: @question, answer_template: { name: '', template_type: 'checkbox', parent_answer_option_value: @answer_template.parent_answer_option_value, text: @answer_template.text }
    end
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_not_nil assigns(:answer_template)
    assert assigns(:answer_template).errors.size > 0
    assert_equal ["can't be blank"], assigns(:answer_template).errors[:name]
    assert_template 'answer_templates/new'
    assert_response :success
  end

  test "should not create answer template as regular user" do
    login(@user)
    assert_difference('AnswerTemplate.count', 0) do
      post :create, question_id: @question, answer_template: { name: 'My New Answer Template', template_type: 'checkbox', parent_answer_option_value: @answer_template.parent_answer_option_value, text: @answer_template.text }
    end
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_nil assigns(:answer_template)
    assert_redirected_to root_path
  end

  test "should show answer template as builder" do
    login(@builder)
    get :show, id: @answer_template
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_not_nil assigns(:answer_template)
    assert_response :success
  end

  test "should not show answer template as regular user" do
    login(@user)
    get :show, id: @answer_template
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_nil assigns(:answer_template)
    assert_redirected_to root_path
  end

  test "should get edit answer template as builder" do
    login(@builder)
    get :edit, id: @answer_template
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_not_nil assigns(:answer_template)
    assert_response :success
  end

  test "should not get edit answer template as regular user" do
    login(@user)
    get :edit, id: @answer_template
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_nil assigns(:answer_template)
    assert_redirected_to root_path
  end

  test "should update answer template as builder" do
    login(@builder)
    patch :update, id: @answer_template, answer_template: { name: 'Updated Answer Template', template_type: 'date', parent_answer_option_value: @answer_template.parent_answer_option_value, text: @answer_template.text }
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_not_nil assigns(:answer_template)
    assert_equal 'Updated Answer Template', assigns(:answer_template).name
    assert_equal 'date', assigns(:answer_template).template_type
    assert_redirected_to builder_answer_template_path(assigns(:answer_template))
  end

  test "should not update answer template without name" do
    login(@builder)
    patch :update, id: @answer_template, answer_template: { name: '', template_type: 'date', parent_answer_option_value: @answer_template.parent_answer_option_value, text: @answer_template.text }
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_not_nil assigns(:answer_template)
    assert assigns(:answer_template).errors.size > 0
    assert_equal ["can't be blank"], assigns(:answer_template).errors[:name]
    assert_template 'answer_templates/edit'
    assert_response :success
  end

  test "should not update answer template as regular user" do
    login(@user)
    patch :update, id: @answer_template, answer_template: { name: 'Updated Answer Template', template_type: 'date', parent_answer_option_value: @answer_template.parent_answer_option_value, text: @answer_template.text }
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_nil assigns(:answer_template)
    assert_redirected_to root_path
  end

  test "should destroy answer template as builder" do
    login(@builder)
    assert_difference('AnswerTemplate.current.count', -1) do
      delete :destroy, id: @answer_template
    end
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:question)
    assert_not_nil assigns(:answer_template)
    assert_redirected_to builder_question_path(assigns(:question))
  end

  test "should not destroy answer template as regular user" do
    login(@user)
    assert_difference('AnswerTemplate.current.count', 0) do
      delete :destroy, id: @answer_template
    end
    assert_nil assigns(:survey)
    assert_nil assigns(:question)
    assert_nil assigns(:answer_template)
    assert_redirected_to root_path
  end


  # setup do
  #   @builder_answer_template = answer_templates(:how_are_you)
  # end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:builder_answer_templates)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create builder_answer_template" do
  #   assert_difference('Builder::AnswerTemplate.count') do
  #     post :create, builder_answer_template: {  }
  #   end

  #   assert_redirected_to builder_answer_template_path(assigns(:builder_answer_template))
  # end

  # test "should show builder_answer_template" do
  #   get :show, id: @builder_answer_template
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @builder_answer_template
  #   assert_response :success
  # end

  # test "should update builder_answer_template" do
  #   patch :update, id: @builder_answer_template, builder_answer_template: {  }
  #   assert_redirected_to builder_answer_template_path(assigns(:builder_answer_template))
  # end

  # test "should destroy builder_answer_template" do
  #   assert_difference('Builder::AnswerTemplate.count', -1) do
  #     delete :destroy, id: @builder_answer_template
  #   end

  #   assert_redirected_to builder_answer_templates_path
  # end
end
