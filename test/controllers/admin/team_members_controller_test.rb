require 'test_helper'

class Admin::TeamMembersControllerTest < ActionController::TestCase
  setup do
    @admin = users(:system_admin)
    @admin_team_member = admin_team_members(:one)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:team_members)
  end

  test "should get new" do
    login(@admin)
    get :new
    assert_response :success
  end

  test "should create admin_team_member" do
    login(@admin)
    assert_difference('Admin::TeamMember.count') do
      post :create, admin_team_member: { bio: @admin_team_member.bio, designations: @admin_team_member.designations, name: @admin_team_member.name, position: @admin_team_member.position, role: @admin_team_member.role }
    end

    assert_redirected_to admin_team_members_path
  end

  test "should get edit" do
    login(@admin)
    get :edit, id: @admin_team_member
    assert_response :success
  end

  test "should update admin_team_member" do
    login(@admin)
    patch :update, id: @admin_team_member, admin_team_member: { bio: @admin_team_member.bio, designations: @admin_team_member.designations, name: @admin_team_member.name, position: @admin_team_member.position, role: @admin_team_member.role }
    assert_redirected_to admin_team_members_path
  end

  test "should destroy admin_team_member" do
    login(@admin)
    assert_difference('Admin::TeamMember.count', -1) do
      delete :destroy, id: @admin_team_member
    end

    assert_redirected_to admin_team_members_path
  end
end
