require 'test_helper'

class Admin::HighlightsControllerTest < ActionController::TestCase
  setup do
    @admin = users(:system_admin)
    @admin_highlight = admin_highlights(:one)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:highlights)
  end

  test "should get new" do
    login(@admin)
    get :new
    assert_response :success
  end

  test "should create admin_highlight" do
    login(@admin)
    assert_difference('Admin::Highlight.count') do
      post :create, admin_highlight: { description: 'This is a new highlight', display_date: Date.current, title: 'New Highlight' }
    end

    assert_redirected_to admin_highlights_path
  end

  test "should show admin_highlight" do
    login(@admin)
    get :show, id: @admin_highlight
    assert_redirected_to admin_highlights_path
  end

  test "should get edit" do
    login(@admin)
    get :edit, id: @admin_highlight
    assert_response :success
  end

  test "should update admin_highlight" do
    login(@admin)
    patch :update, id: @admin_highlight, admin_highlight: { title: 'Updated Title' }
    assert_redirected_to admin_highlights_path
  end

  test "should destroy admin_highlight" do
    login(@admin)
    assert_difference('Admin::Highlight.current.count', -1) do
      delete :destroy, id: @admin_highlight
    end

    assert_redirected_to admin_highlights_path
  end
end
