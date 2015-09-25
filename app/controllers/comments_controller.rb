class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_research_topic
  before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]
  before_action :authenticate_owner_or_admin!, only: [:edit, :update, :destroy]

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.where(research_topic_id: @research_topic.id).new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to research_topic_path(@research_topic), notice: 'Comment was successfully created.' }
        format.json { render @research_topic, status: :created, location: @comment }
      else
        format.html { render @research_topic }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to research_topic_path(@research_topic), notice: 'Comment was successfully updated.' }
        format.json { render @research_topic, status: :ok, location: @comment }
      else
        format.html { render @research_topic }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to research_topic_path(@research_topic), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_owner_or_admin!
      redirect_to research_topic_path(@research_topic), alert: "You do not have sufficient privileges to access that page." unless (current_user.admin? or current_user==@comment.user)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_research_topic
      @research_topic = ResearchTopic.find(params[:research_topic_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :research_topic_id, :description, :deleted, :status, :deleted_by_id, :last_moderated_by_id, :last_moderated_at)
    end
end
