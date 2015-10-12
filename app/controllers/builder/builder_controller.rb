class Builder::BuilderController < ApplicationController
  private

  def redirect_non_builders
    empty_response_or_root_path unless current_user.survey_builder?
  end

  def set_editable_survey(survey_id = :survey_id)
    @survey = current_user.editable_surveys.find_by_id(params[survey_id])
  end

  def redirect_without_survey
    empty_response_or_root_path(builder_surveys_path) unless @survey
  end

  def set_editable_question(question_id = :question_id)
    @question = Question.current.find_by_id(params[question_id])
  end

  def redirect_without_question
    empty_response_or_root_path(builder_surveys_path) unless @question
  end

  def set_editable_answer_template(answer_template_id = :answer_template_id)
    @answer_template = AnswerTemplate.current.find_by_id(params[answer_template_id])
  end

  def redirect_without_answer_template
    empty_response_or_root_path(builder_surveys_path) unless @answer_template
  end

  def set_editable_answer_option(answer_option_id = :answer_option_id)
    @answer_option = AnswerOption.current.find_by_id(params[answer_option_id])
  end

  def redirect_without_answer_option
    empty_response_or_root_path(builder_surveys_path) unless @answer_option
  end
end
