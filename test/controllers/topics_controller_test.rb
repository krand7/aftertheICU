require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @forum = forums(:one)
    @topic = topics(:one)
    @user = users(:forum)
    @admin = users(:system_admin)
  end

  test "should get index" do
    get :index, forum_id: @forum
    assert_response :success
    assert_not_nil assigns(:forum)
    assert_not_nil assigns(:topics)
  end

  test "should get new as user" do
    login(@user)
    get :new, forum_id: @forum
    assert_response :success
  end

  test "should create topic as user" do
    login(@user)
    assert_difference('Topic.count') do
      post :create, forum_id: @forum, topic: { name: 'introduction' }
    end

    assert_redirected_to forum_topic_path(@forum, assigns(:topic))
  end

  test "should show topic" do
    get :show, forum_id: @forum, id: @topic
    assert_response :success
  end

  test "should get edit as creator of topic or admin" do
    login(@user)
    get :edit, forum_id: @forum, id: @topic
    assert_response :success
  end

  test "should not get edit as other user" do
    get :edit, forum_id: @forum, id: @topic
    assert_response :redirect

    login(users(:new))
    get :edit, forum_id: @forum, id: @topic
    assert_response :redirect
  end

  test "should update topic as creator of topic or admin" do
    login(@user)
    patch :update, forum_id: @forum, id: @topic, topic: { name: 'introduction' }
    assert_redirected_to forum_topic_path(@forum, assigns(:topic))
    assert_equal assigns(:topic).name, 'introduction'
  end

  test "should destroy topic as creator of topic or admin" do
    login(@user)
    assert_difference('Topic.current.count', -1) do
      delete :destroy, forum_id: @forum, id: @topic
    end

    assert_redirected_to forum_topics_path(@forum)
  end
end
