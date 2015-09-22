require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @forum = forums(:one)
    @topic = topics(:one)
  end

  test "should get index" do
    get :index, forum_id: @forum
    assert_response :success
    assert_not_nil assigns(:forum)
    assert_not_nil assigns(:topics)
  end

  test "should get new" do
    get :new, forum_id: @forum
    assert_response :success
  end

  test "should create topic" do
    assert_difference('Topic.count') do
      post :create, forum_id: @forum, topic: { name: 'introduction' }
    end

    assert_redirected_to forum_topic_path(@forum, assigns(:topic))
  end

  test "should show topic" do
    get :show, forum_id: @forum, id: @topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, forum_id: @forum, id: @topic
    assert_response :success
  end

  test "should update topic" do
    patch :update, forum_id: @forum, id: @topic, topic: { name: 'introduction' }
    assert_redirected_to forum_topic_path(@forum, assigns(:topic))
  end

  test "should destroy topic" do
    assert_difference('Topic.current.count', -1) do
      delete :destroy, forum_id: @forum, id: @topic
    end

    assert_redirected_to forum_topics_path(@forum)
  end
end
