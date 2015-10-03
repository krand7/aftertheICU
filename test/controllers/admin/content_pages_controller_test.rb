require 'test_helper'

class Admin::ContentPagesControllerTest < ActionController::TestCase
  setup do
    @admin = users(:system_admin)
    @admin_content_group = admin_content_groups(:one)
    @admin_content_page = admin_content_pages(:one)
  end

  test "should get index" do
    login(@admin)
    get :index, content_group_id: @admin_content_group
    assert_redirected_to admin_content_group_path(@admin_content_group)
    assert_not_nil assigns(:content_group)
  end

  test "should get new" do
    login(@admin)
    get :new, content_group_id: @admin_content_group
    assert_response :success
  end

  test "should create admin_content_page" do
    login(@admin)
    assert_difference('Admin::ContentPage.count') do
      post :create, content_group_id: @admin_content_group, admin_content_page: { content_group_id: @admin_content_page.content_group_id, content: @admin_content_page.content, deleted: @admin_content_page.deleted, photo: @admin_content_page.photo, position: @admin_content_page.position, slug: @admin_content_page.slug, title: @admin_content_page.title }
    end

    assert_redirected_to admin_content_group_content_page_path(@admin_content_group, assigns(:content_page))
  end

  test "should show admin_content_page" do
    login(@admin)
    get :show, content_group_id: @admin_content_group, id: @admin_content_page
    assert_response :success
  end

  test "should get edit" do
    login(@admin)
    get :edit, content_group_id: @admin_content_group, id: @admin_content_page
    assert_response :success
  end

  test "should update admin_content_page" do
    login(@admin)
    patch :update, content_group_id: @admin_content_group, id: @admin_content_page, admin_content_page: { content_group_id: @admin_content_page.content_group_id, content: @admin_content_page.content, deleted: @admin_content_page.deleted, photo: @admin_content_page.photo, position: @admin_content_page.position, slug: @admin_content_page.slug, title: @admin_content_page.title }
    assert_redirected_to admin_content_group_content_page_path(@admin_content_group, assigns(:content_page))
  end

  test "should destroy admin_content_page" do
    login(@admin)
    assert_difference('Admin::ContentPage.current.count', -1) do
      delete :destroy, content_group_id: @admin_content_group, id: @admin_content_page
    end

    assert_redirected_to admin_content_group_path(@admin_content_group)
  end
end
