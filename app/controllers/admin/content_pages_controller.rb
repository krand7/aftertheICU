class Admin::ContentPagesController < ApplicationController
  before_action :set_content_group
  before_action :set_content_page, only: [:show, :edit, :update, :destroy]

  # GET /admin/content_pages
  # GET /admin/content_pages.json
  def index
    redirect_to @content_group
    # @content_pages = @content_group.content_pages.current
  end

  # GET /admin/content_pages/1
  # GET /admin/content_pages/1.json
  def show
  end

  # GET /admin/content_pages/new
  def new
    @content_page = @content_group.content_pages.new
  end

  # GET /admin/content_pages/1/edit
  def edit
  end

  # POST /admin/content_pages/1/preview
  def preview
    @content_page = @content_group.content_pages.new(content_page_params) unless @content_page.present?
  end

  # POST /admin/content_pages
  # POST /admin/content_pages.json
  def create
    @content_page = @content_group.content_pages.new(content_page_params)

    respond_to do |format|
      if @content_page.save
        format.html { redirect_to admin_content_group_content_page_path(@content_group, @content_page), notice: 'Content page was successfully created.' }
        format.json { render :show, status: :created, location: @content_page }
      else
        format.html { render :new }
        format.json { render json: @content_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/content_pages/1
  # PATCH/PUT /admin/content_pages/1.json
  def update
    respond_to do |format|
      if @content_page.update(content_page_params)
        format.html { redirect_to admin_content_group_content_page_path(@content_group, @content_page), notice: 'Content page was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_page }
      else
        format.html { render :edit }
        format.json { render json: @content_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/content_pages/1
  # DELETE /admin/content_pages/1.json
  def destroy
    @content_page.destroy
    respond_to do |format|
      format.html { redirect_to admin_content_group_url(@content_group), notice: 'Content page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_group
      @content_group = Admin::ContentGroup.find(params[:content_group_id])
    end

    def set_content_page
      @content_page = @content_group.content_pages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_page_params
      params.require(:admin_content_page).permit(:title, :slug, :deleted, :position, :content_group_id, :content, :photo)
    end
end
