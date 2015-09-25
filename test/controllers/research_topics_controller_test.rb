require 'test_helper'

class ResearchTopicsControllerTest < ActionController::TestCase
  setup do
    @research_topic = research_topics(:one)
    @user = users(:research)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:research_topics)
  end

  test "should get new" do
    login(@user)
    get :new
    assert_response :success
  end

  test "should create research_topic" do
    login(@user)
    assert_difference('ResearchTopic.current.count') do
      post :create, research_topic: { description: 'This is the reasoning for a new research topic', name: 'New research topic', slug: 'new-research-topic' }
    end

    assert_redirected_to research_topic_path(assigns(:research_topic))
  end

  test "should show approved research_topic" do
    get :show, id: @research_topic
    assert_response :success
  end

  test "should not show unapproved research_topic" do
    get :show, id: research_topics(:two)
    assert_response :redirect
  end

  test "should get edit for admin or owner of research topic" do
    login(@user)
    get :edit, id: @research_topic
    assert_response :success
  end

  test "should update research_topic as admin or owner of research topic" do
    login(@user)
    patch :update, id: @research_topic, research_topic: { progress: 'approved' }
    assert_redirected_to research_topic_path(assigns(:research_topic))
  end

  test "should destroy research_topic as admin or owner of research topic" do
    login(@user)
    assert_difference('ResearchTopic.current.count', -1) do
      delete :destroy, id: @research_topic
    end

    assert_redirected_to research_topics_path
  end
end
