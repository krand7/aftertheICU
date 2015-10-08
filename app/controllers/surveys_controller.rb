class SurveysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_survey, only: [:show, :report]
  before_action :set_response_session, only: [:show, :report]
  before_action :redirect_without_response_session, only: [:show]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  def report
  end

  def process_answer
    @question = Question.find_by_param(params[:question_id])
    @response_session = current_user.response_sessions.find_by_id(params[:response_session_id])
    response = params[:response] || {}

    if @response_session and @question and @response = @response_session.process_answer(@question, response)
      render json: { completed: @response.complete?, invalid: @response.invalid?, value: @response.string_value, errors: @response.errors.full_messages, validation_errors: @response.validation_errors }
    else
      head :no_content
    end
  end

  def submit
    if @response_session = current_user.response_sessions.find_by_id(params[:response_session_id])
      @response_session.lock! if @response_session.completed?
      render json: { locked: @response_session.locked? }
    else
      head :no_content
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def set_response_session
      @response_session = current_user.get_baseline_survey_response_session(@survey) if @survey
    end

    def redirect_without_response_session
      redirect_to surveys_path unless @response_session
    end
end
