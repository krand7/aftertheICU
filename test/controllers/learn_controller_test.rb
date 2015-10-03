require 'test_helper'

class LearnControllerTest < ActionController::TestCase
  setup do
    @content_page = admin_content_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, content_page_slug: @content_page.slug
    assert_response :success
  end
end
