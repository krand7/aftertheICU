require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  setup do
    @research_topic = research_topics(:one)
    @vote = votes(:two)
    @user = users(:regular)
    @voter = users(:voter)
  end

  test "should create vote" do
    login(@user)
    assert_difference('Vote.count') do
      post :create, research_topic_id: @research_topic, vote: { deleted: @vote.deleted, rating: @vote.rating, research_topic_id: @vote.research_topic_id, user_id: @vote.user_id }
    end

    assert_redirected_to research_topic_path(@research_topic)
  end

  test "should update vote" do
    login(@voter)
    patch :update, research_topic_id: @research_topic, id: @vote, vote: { rating: @vote.rating }
    assert_redirected_to research_topic_path(@research_topic)
  end

  test "should destroy vote" do
    login(@voter)
    assert_difference('Vote.current.count', -1) do
      delete :destroy, research_topic_id: @research_topic, id: @vote
    end

    assert_redirected_to research_topic_path(@research_topic)
  end
end
