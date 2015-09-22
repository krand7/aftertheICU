require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @forum = forums(:one)
    @topic = topics(:one)
    @post = posts(:one)
  end

  test "should get index" do
    get :index, forum_id: @forum, topic_id: @topic
    assert_response :success
    assert_not_nil assigns(:forum)
    assert_not_nil assigns(:topic)
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new, forum_id: @forum, topic_id: @topic
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, forum_id: @forum, topic_id: @topic, post: { description: 'hello' }
    end

    assert_redirected_to forum_topic_post_path(@forum, @topic, assigns(:post))
  end

  test "should show post" do
    get :show, forum_id: @forum, topic_id: @topic, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, forum_id: @forum, topic_id: @topic, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, forum_id: @forum, topic_id: @topic, id: @post, post: { description: 'world' }
    assert_redirected_to forum_topic_post_path(@forum, @topic, assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, forum_id: @forum, topic_id: @topic, id: @post
    end

    assert_redirected_to forum_topic_posts_path(@forum, @topic)
  end
end
