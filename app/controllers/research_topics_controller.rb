class ResearchTopicsController < ApplicationController
  before_action :set_research_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :authenticate_owner_or_admin!, only: [:edit, :update, :destroy]

  # GET /research_topics
  # GET /research_topics.json
  def index
    @research_topics = ResearchTopic.current
  end

  # GET /research_topics/1
  # GET /research_topics/1.json
  def show
    redirect_to research_topics_path and return unless @research_topic.progress == 'approved'
    @vote = current_user.votes.where(research_topic_id: @research_topic.id).first_or_initialize if current_user
  end

  # GET /research_topics/new
  def new
    @research_topic = current_user.research_topics.new
  end

  # GET /research_topics/1/edit
  def edit
  end

  # POST /research_topics
  # POST /research_topics.json
  def create
    @research_topic = current_user.research_topics.new(research_topic_params)

    respond_to do |format|
      if @research_topic.save
        format.html { redirect_to @research_topic, notice: 'Research topic was successfully created.' }
        format.json { render :show, status: :created, location: @research_topic }
      else
        format.html { render :new }
        format.json { render json: @research_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /research_topics/1
  # PATCH/PUT /research_topics/1.json
  def update
    respond_to do |format|
      if @research_topic.update(research_topic_params)
        format.html { redirect_to @research_topic, notice: 'Research topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @research_topic }
      else
        format.html { render :edit }
        format.json { render json: @research_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_topics/1
  # DELETE /research_topics/1.json
  def destroy
    @research_topic.destroy
    respond_to do |format|
      format.html { redirect_to research_topics_url, notice: 'Research topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_owner_or_admin!
      redirect_to research_topics_path, alert: "You do not have sufficient privileges to access that page." unless (current_user.admin? or current_user==@research_topic.user)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_research_topic
      @research_topic = ResearchTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_topic_params
      params.require(:research_topic).permit(:name, :description, :deleted, :progress, :slug)
    end
end
