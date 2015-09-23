require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @forum = forums(:one)
    @topic = topics(:one)
    @post = posts(:one)
    @user = users(:forum)
    @admin = users(:system_admin)
  end

  test "should get index" do
    get :index, forum_id: @forum, topic_id: @topic
    assert_redirected_to [@forum, @topic]
    assert_not_nil assigns(:forum)
    assert_not_nil assigns(:topic)
  end

  test "should get new" do
    login(@user)
    get :new, forum_id: @forum, topic_id: @topic
    assert_response :success
  end

  test "should create post" do
    login(@user)
    assert_difference('Post.count') do
      post :create, forum_id: @forum, topic_id: @topic, post: { description: 'hello' }
    end

    assert_redirected_to forum_topic_path(@forum, @topic)
  end

  test "should show post" do
    get :show, forum_id: @forum, topic_id: @topic, id: @post
    assert_redirected_to [@forum, @topic]
  end

  test "should get edit as post creator or admin" do
    login(@user)
    get :edit, forum_id: @forum, topic_id: @topic, id: @post
    assert_response :success

    login(@admin)
    get :edit, forum_id: @forum, topic_id: @topic, id: @post
    assert_response :success
  end

  test "should not get edit as other user" do
    login(users(:regular))
    get :edit, forum_id: @forum, topic_id: @topic, id: @post
    assert_response :redirect
  end

  test "should update post as post creator or admin" do
    login(@user)
    patch :update, forum_id: @forum, topic_id: @topic, id: @post, post: { description: 'world' }
    assert_redirected_to forum_topic_post_path(@forum, @topic, assigns(:post))
    assert_equal assigns(:post).description, 'world'
  end

  test "should not update post as other user" do
    patch :update, forum_id: @forum, topic_id: @topic, id: @post, post: { description: 'world' }
    assert_response :redirect
    assert_not_equal assigns(:post).description, 'world'
  end

  test "should destroy post as post creator or admin" do
    login(@user)
    assert_difference('Post.current.count', -1) do
      delete :destroy, forum_id: @forum, topic_id: @topic, id: @post
    end
    assert_redirected_to forum_topic_path(@forum, @topic)
  end

  test "should not destroy post as other user" do
    login(users(:regular))
    assert_no_difference('Post.current.count', -1) do
      delete :destroy, forum_id: @forum, topic_id: @topic, id: @post
    end
    assert_redirected_to forum_topic_path(@forum, @topic)
  end
end
