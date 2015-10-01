class Admin::PartnersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  # GET /admin/partners
  # GET /admin/partners.json
  def index
    @partners = Admin::Partner.order('position')
  end

  # GET /admin/partners/new
  def new
    @partner = Admin::Partner.new
  end

  # GET /admin/partners/1/edit
  def edit
  end

  # POST /admin/partners
  # POST /admin/partners.json
  def create
    @partner = Admin::Partner.new(partner_params)

    respond_to do |format|
      if @partner.save
        format.html { redirect_to admin_partners_path, notice: 'Partner was successfully created.' }
        format.json { render :show, status: :created, location: @partner }
      else
        format.html { render :new }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/partners/1
  # PATCH/PUT /admin/partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to admin_partners_path, notice: 'Partner was successfully updated.' }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/partners/1
  # DELETE /admin/partners/1.json
  def destroy
    @partner.destroy
    respond_to do |format|
      format.html { redirect_to admin_partners_url, notice: 'Partner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Admin::Partner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_params
      params.require(:admin_partner).permit(:name, :description, :photo, :link, :deleted, :displayed, :position)
    end
end
