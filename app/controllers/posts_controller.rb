class PostsController < ApplicationController
  before_action :set_forum
  before_action :set_topic
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_owner_or_admin!, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    redirect_to [@forum, @topic]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    redirect_to forum_topic_path(@forum, @topic)
  end

  # GET /posts/new
  def new
    @post = current_user.posts.where(topic_id: @topic).new
  end

  def preview
    @post = current_user.posts.where(topic_id: @topic).new(post_params) unless @post.present?
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.where(topic_id: @topic).new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@forum, @topic], notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: [@forum, @topic] }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [@forum, @topic, @post], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: [@forum, @topic, @post] }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to forum_topic_path(@forum, @topic), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_owner_or_admin!
      redirect_to forum_topic_path(@forum, @topic), alert: "You do not have sufficient privileges to access that page." unless (current_user.admin? or current_user==@post.user)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:forum_id])
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params[:post] ||= { blank: '1' }
      params.require(:post).permit(:description, :status, :links_enabled)
    end
end
