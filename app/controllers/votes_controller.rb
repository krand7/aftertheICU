class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_research_topic, only: [:create, :update, :destroy]
  before_action :set_vote, only: [:update, :destroy]

  # POST /votes
  # POST /votes.json
  def create
    @vote = current_user.votes.where(rating: params[:endorse]).new(vote_params)

    respond_to do |format|
      if @vote.save
        @research_topic.add_comment(current_user, params[:comment]) if params[:comment].present?
        format.html { redirect_to research_topic_path(@research_topic), notice: 'Thank you for your input!' }
      else
        format.html { render research_topic_path(@research_topic), notice: 'There was an error casting your vote.' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to research_topic_path(@research_topic), notice: 'Vote was successfully updated.' }
        format.json { render @research_topic, status: :ok, location: @vote }
      else
        format.html { render research_topic_path(@research_topic), notice: 'There was an error updating your vote.' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to research_topic_path(@research_topic), notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_topic
      @research_topic = ResearchTopic.find(params[:research_topic_id])
    end

    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:user_id, :research_topic_id, :rating, :deleted)
    end
end
