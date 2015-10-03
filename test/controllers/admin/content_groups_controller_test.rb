require 'test_helper'

class Admin::ContentGroupsControllerTest < ActionController::TestCase
  setup do
    @admin = users(:system_admin)
    @admin_content_group = admin_content_groups(:one)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:content_groups)
  end

  test "should get new" do
    login(@admin)
    get :new
    assert_response :success
  end

  test "should create admin_content_group" do
    login(@admin)
    assert_difference('Admin::ContentGroup.count') do
      post :create, admin_content_group: { deleted: @admin_content_group.deleted, description: @admin_content_group.description, position: @admin_content_group.position, slug: @admin_content_group.slug, title: @admin_content_group.title }
    end

    assert_redirected_to admin_content_group_path(assigns(:content_group))
  end

  test "should show admin_content_group" do
    login(@admin)
    get :show, id: @admin_content_group
    assert_response :success
  end

  test "should get edit" do
    login(@admin)
    get :edit, id: @admin_content_group
    assert_response :success
  end

  test "should update admin_content_group" do
    login(@admin)
    patch :update, id: @admin_content_group, admin_content_group: { deleted: @admin_content_group.deleted, description: @admin_content_group.description, position: @admin_content_group.position, slug: @admin_content_group.slug, title: @admin_content_group.title }
    assert_redirected_to admin_content_group_path(assigns(:content_group))
  end

  test "should destroy admin_content_group" do
    login(@admin)
    assert_difference('Admin::ContentGroup.current.count', -1) do
      delete :destroy, id: @admin_content_group
    end

    assert_redirected_to admin_content_groups_path
  end
end
