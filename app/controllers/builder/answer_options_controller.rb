class Builder::AnswerOptionsController < Builder::BuilderController
  before_action :authenticate_user!
  before_action :redirect_non_builders

  before_action :set_editable_answer_option, only: [:show, :edit, :update, :destroy]
  before_action :redirect_without_answer_option, only: [:show, :edit, :update, :destroy]

  before_action :set_editable_answer_template
  before_action :redirect_without_answer_template

  before_action :set_editable_question
  before_action :redirect_without_question

  before_action :set_editable_survey
  before_action :redirect_without_survey

  # GET /builder/answer_options
  # GET /builder/answer_options.json
  def index
    redirect_to builder_answer_template_path(@answer_template)
  end

  # GET /builder/answer_options/1
  # GET /builder/answer_options/1.json
  def show
  end

  # GET /builder/answer_options/new
  def new
    @answer_option = @answer_template.answer_options.new
  end

  # GET /builder/answer_options/1/edit
  def edit
  end

  # POST /builder/answer_options
  # POST /builder/answer_options.json
  def create
    @answer_option = @answer_template.answer_options.where(user_id: current_user.id).new(answer_option_params)

    respond_to do |format|
      if @answer_option.save
        format.html { redirect_to builder_answer_template_path(@answer_template), notice: 'Answer option was successfully created.' }
        format.json { render :show, status: :created, location: @answer_option }
      else
        format.html { render :new }
        format.json { render json: @answer_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /builder/answer_options/1
  # PATCH/PUT /builder/answer_options/1.json
  def update
    respond_to do |format|
      if @answer_option.update(answer_option_params)
        format.html { redirect_to builder_answer_template_path(@answer_template), notice: 'Answer option was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer_option }
      else
        format.html { render :edit }
        format.json { render json: @answer_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builder/answer_options/1
  # DELETE /builder/answer_options/1.json
  def destroy
    @answer_option.destroy
    respond_to do |format|
      format.html { redirect_to builder_answer_template_path(@answer_template), notice: 'Answer option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editable_answer_option
      super(:id)
    end

    # Answer template id used for index, new, and create
    def set_editable_answer_template
      @answer_template = params[:answer_template_id].present? ? super(:answer_template_id) : @answer_option.answer_template
    end

    def set_editable_question
      @question = @answer_template.question
    end

    def set_editable_survey
      @survey = @question.survey
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_option_params
      params.require(:answer_option).permit(:text, :value, :hotkey, :display_class)
    end
end
