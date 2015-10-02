class Admin::HighlightsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_highlight, only: [:show, :edit, :update, :destroy]

  # GET /admin/highlights
  # GET /admin/highlights.json
  def index
    @highlights = Admin::Highlight.current
  end

  # GET /admin/highlights/1
  # GET /admin/highlights/1.json
  def show
    redirect_to admin_highlights_path
  end

  # GET /admin/highlights/new
  def new
    @highlight = Admin::Highlight.new
  end

  # GET /admin/highlights/1/edit
  def edit
  end

  # POST /admin/highlights
  # POST /admin/highlights.json
  def create
    @highlight = Admin::Highlight.new(highlight_params)

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to admin_highlights_path, notice: 'Highlight was successfully created.' }
        format.json { render :show, status: :created, location: @highlight }
      else
        format.html { render :new }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/highlights/1
  # PATCH/PUT /admin/highlights/1.json
  def update
    respond_to do |format|
      if @highlight.update(highlight_params)
        format.html { redirect_to admin_highlights_path, notice: 'Highlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @highlight }
      else
        format.html { render :edit }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/highlights/1
  # DELETE /admin/highlights/1.json
  def destroy
    @highlight.destroy
    respond_to do |format|
      format.html { redirect_to admin_highlights_url, notice: 'Highlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highlight
      @highlight = Admin::Highlight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def highlight_params
      params.require(:admin_highlight).permit(:title, :description, :photo, :display_date, :deleted, :link, :displayed)
    end
end
