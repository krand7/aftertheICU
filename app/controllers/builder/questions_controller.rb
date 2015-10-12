class Builder::QuestionsController < Builder::BuilderController
  before_action :authenticate_user!
  before_action :redirect_non_builders

  before_action :set_editable_question,     only: [:show, :edit, :update, :destroy]
  before_action :redirect_without_question, only: [:show, :edit, :update, :destroy]

  before_action :set_editable_survey
  before_action :redirect_without_survey

  # GET /builder/questions
  # GET /builder/questions.json
  def index
    redirect_to builder_survey_path(@survey)
  end

  # GET /builder/questions/1
  # GET /builder/questions/1.json
  def show
  end

  # GET /builder/questions/new
  def new
    @question = @survey.questions.new
  end

  # GET /builder/questions/1/edit
  def edit
  end

  # POST /builder/questions
  # POST /builder/questions.json
  def create
    @question = @survey.questions.where(user_id: current_user.id).new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to builder_question_path(@question), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /builder/questions/1
  # PATCH/PUT /builder/questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to builder_question_path(@question), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builder/questions/1
  # DELETE /builder/questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to builder_survey_path(@survey), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editable_question
      super(:id)
    end

    def set_editable_survey
      @survey = params[:survey_id].present? ? super(:survey_id) : @question.survey
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :slug)
    end
end
