class TopicsController < ApplicationController
  before_action :set_forum
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_owner_or_admin!, only: [:edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = @forum.topics
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic.increase_view_count
  end

  # GET /topics/new
  def new
    @topic = @forum.topics.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = @forum.topics.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to [@forum, @topic], notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: [@forum, @topic] }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to [@forum, @topic], notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: [@forum, @topic] }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to forum_topics_url(@forum), notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_owner_or_admin!
      redirect_to forum_topic_path(@forum, @topic), alert: "You do not have sufficient privileges to access that page." unless (current_user.admin? or current_user==@topic.user)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:forum_id])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :slug, :locked, :pinned, :status, :forum_id)
    end
end
