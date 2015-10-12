class Builder::AnswerTemplatesController < Builder::BuilderController
  before_action :authenticate_user!
  before_action :redirect_non_builders

  before_action :set_editable_answer_template, only: [:show, :edit, :update, :destroy]
  before_action :redirect_without_answer_template, only: [:show, :edit, :update, :destroy]

  before_action :set_editable_question
  before_action :redirect_without_question

  before_action :set_editable_survey
  before_action :redirect_without_survey

  # GET /builder/answer_templates
  # GET /builder/answer_templates.json
  def index
    redirect_to builder_question_path(@question)
  end

  # GET /builder/answer_templates/1
  # GET /builder/answer_templates/1.json
  def show
  end

  # GET /builder/question/1/answer_templates/new
  def new
    @answer_template = @question.answer_templates.new
  end

  # GET /builder/answer_templates/1/edit
  def edit
  end

  # POST /builder/answer_templates
  # POST /builder/answer_templates.json
  def create
    @answer_template = @question.answer_templates.where(user_id: current_user.id).new(answer_template_params)

    respond_to do |format|
      if @answer_template.save
        format.html { redirect_to builder_answer_template_path(@answer_template), notice: 'Answer template was successfully created.' }
        format.json { render :show, status: :created, location: @builder_answer_template }
      else
        format.html { render :new }
        format.json { render json: @answer_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /builder/answer_templates/1
  # PATCH/PUT /builder/answer_templates/1.json
  def update
    respond_to do |format|
      if @answer_template.update(answer_template_params)
        format.html { redirect_to builder_answer_template_path(@answer_template), notice: 'Answer template was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer_template }
      else
        format.html { render :edit }
        format.json { render json: @answer_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builder/answer_templates/1
  # DELETE /builder/answer_templates/1.json
  def destroy
    @answer_template.destroy
    respond_to do |format|
      format.html { redirect_to builder_question_path(@question), notice: 'Answer template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editable_answer_template
      super(:id)
    end

    def set_editable_question
      @question = params[:question_id].present? ? super(:question_id) : @answer_template.question
    end

    def set_editable_survey
      @survey = @question.survey
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_template_params
      params.require(:answer_template).permit(:name, :template_type, :parent_answer_template_id, :parent_answer_option_value, :text, :unit)
    end
end
