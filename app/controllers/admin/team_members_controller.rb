class Admin::TeamMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  # GET /admin/team_members
  # GET /admin/team_members.json
  def index
    @team_members = Admin::TeamMember.order('position')
  end

  # GET /admin/team_members/new
  def new
    @team_member = Admin::TeamMember.new
  end

  # GET /admin/team_members/1/edit
  def edit
  end

  # POST /admin/team_members
  # POST /admin/team_members.json
  def create
    @team_member = Admin::TeamMember.new(team_member_params)

    respond_to do |format|
      if @team_member.save
        format.html { redirect_to admin_team_members_path, notice: 'Team member was successfully created.' }
        format.json { render :show, status: :created, location: @admin_team_member }
      else
        format.html { render :new }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/team_members/1
  # PATCH/PUT /admin/team_members/1.json
  def update
    respond_to do |format|
      if @team_member.update(team_member_params)
        format.html { redirect_to admin_team_members_path, notice: 'Team member was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_team_member }
      else
        format.html { render :edit }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/team_members/1
  # DELETE /admin/team_members/1.json
  def destroy
    @team_member.destroy
    respond_to do |format|
      format.html { redirect_to admin_team_members_url, notice: 'Team member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_member
      @team_member = Admin::TeamMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_member_params
      params.require(:admin_team_member).permit(:name, :designations, :role, :position, :bio, :photo)
    end
end
