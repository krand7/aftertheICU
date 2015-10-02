require 'test_helper'

class Admin::ConsentFormsControllerTest < ActionController::TestCase
  setup do
    @admin = users(:system_admin)
    @admin_consent_form = admin_consent_forms(:default)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:consent_forms)
  end

  test "should get new" do
    login(@admin)
    get :new
    assert_response :success
  end

  test "should create admin_consent_form" do
    login(@admin)
    assert_difference('Admin::ConsentForm.count') do
      post :create, admin_consent_form: { name: 'new_consent', title: 'New Consent', content: 'This is the new consent' }
    end

    assert_redirected_to admin_consent_form_path(assigns(:consent_form))
  end

  test "should show admin_consent_form" do
    login(@admin)
    get :show, id: @admin_consent_form
    assert_response :success
  end

  test "should get edit" do
    login(@admin)
    get :edit, id: @admin_consent_form
    assert_response :success
  end

  test "should update admin_consent_form" do
    login(@admin)
    patch :update, id: @admin_consent_form, admin_consent_form: { title: 'Updated title' }
    assert_redirected_to admin_consent_form_path(assigns(:consent_form))
  end

  test "should destroy admin_consent_form" do
    login(@admin)
    assert_difference('Admin::ConsentForm.current.count', -1) do
      delete :destroy, id: @admin_consent_form
    end

    assert_redirected_to admin_consent_forms_path
  end
end
