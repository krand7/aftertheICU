class Admin::ContentGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_content_group, only: [:show, :edit, :update, :destroy]

  # GET /admin/content_groups
  # GET /admin/content_groups.json
  def index
    @content_groups = Admin::ContentGroup.current
  end

  # GET /admin/content_groups/1
  # GET /admin/content_groups/1.json
  def show
    @content_pages = @content_group.content_pages
  end

  # GET /admin/content_groups/new
  def new
    @content_group = Admin::ContentGroup.new
  end

  # GET /admin/content_groups/1/edit
  def edit
  end

  # POST /admin/content_groups
  # POST /admin/content_groups.json
  def create
    @content_group = Admin::ContentGroup.new(content_group_params)

    respond_to do |format|
      if @content_group.save
        format.html { redirect_to @content_group, notice: 'Content group was successfully created.' }
        format.json { render :show, status: :created, location: @content_group }
      else
        format.html { render :new }
        format.json { render json: @content_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/content_groups/1
  # PATCH/PUT /admin/content_groups/1.json
  def update
    respond_to do |format|
      if @content_group.update(content_group_params)
        format.html { redirect_to @content_group, notice: 'Content group was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_group }
      else
        format.html { render :edit }
        format.json { render json: @content_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/content_groups/1
  # DELETE /admin/content_groups/1.json
  def destroy
    @content_group.destroy
    respond_to do |format|
      format.html { redirect_to admin_content_groups_url, notice: 'Content group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_group
      @content_group = Admin::ContentGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_group_params
      params.require(:admin_content_group).permit(:title, :slug, :deleted, :position, :description)
    end
end
