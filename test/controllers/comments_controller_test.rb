require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:voter)
    @comment = comments(:one)
    @research_topic = research_topics(:one)
  end

  test "should create comment" do
    login(@user)
    assert_difference('Comment.count') do
      post :create, research_topic_id: @research_topic, comment: { deleted: @comment.deleted, deleted_by_id: @comment.deleted_by_id, description: @comment.description, last_moderated_at: @comment.last_moderated_at, last_moderated_by_id: @comment.last_moderated_by_id, research_topic_id: @comment.research_topic_id, status: @comment.status, user_id: @comment.user_id }
    end

    assert_redirected_to research_topic_path(@research_topic)
  end

  test "should get edit" do
    login(@user)
    get :edit, research_topic_id: @research_topic, id: @comment
    assert_response :success
  end

  test "should update comment" do
    login(@user)
    patch :update, research_topic_id: @research_topic, id: @comment, comment: { deleted: @comment.deleted, deleted_by_id: @comment.deleted_by_id, description: @comment.description, last_moderated_at: @comment.last_moderated_at, last_moderated_by_id: @comment.last_moderated_by_id, research_topic_id: @comment.research_topic_id, status: @comment.status, user_id: @comment.user_id }
    assert_redirected_to research_topic_path(@research_topic)
  end

  test "should destroy comment" do
    login(@user)
    assert_difference('Comment.current.count', -1) do
      delete :destroy, research_topic_id: @research_topic, id: @comment
    end

    assert_redirected_to research_topic_path(@research_topic)
  end
end
