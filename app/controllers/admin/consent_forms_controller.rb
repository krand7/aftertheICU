class Admin::ConsentFormsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_consent_form, only: [:show, :edit, :update, :destroy]

  # GET /admin/consent_forms
  # GET /admin/consent_forms.json
  def index
    @consent_forms = Admin::ConsentForm.current
  end

  # GET /admin/consent_forms/1
  # GET /admin/consent_forms/1.json
  def show
  end

  # GET /admin/consent_forms/new
  def new
    @consent_form = Admin::ConsentForm.new
  end

  # GET /admin/consent_forms/1/edit
  def edit
  end

  # POST /admin/consent_forms/1/preview
  def preview
    @consent_form = Admin::ConsentForm.current.new(consent_form_params) unless @consent_form.present?
  end

  # POST /admin/consent_forms
  # POST /admin/consent_forms.json
  def create
    @consent_form = Admin::ConsentForm.new(consent_form_params)

    respond_to do |format|
      if @consent_form.save
        format.html { redirect_to @consent_form, notice: 'Consent form was successfully created.' }
        format.json { render :show, status: :created, location: @consent_form }
      else
        format.html { render :new }
        format.json { render json: @consent_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/consent_forms/1
  # PATCH/PUT /admin/consent_forms/1.json
  def update
    respond_to do |format|
      if @consent_form.update(consent_form_params)
        format.html { redirect_to @consent_form, notice: 'Consent form was successfully updated.' }
        format.json { render :show, status: :ok, location: @consent_form }
      else
        format.html { render :edit }
        format.json { render json: @consent_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/consent_forms/1
  # DELETE /admin/consent_forms/1.json
  def destroy
    @consent_form.destroy
    respond_to do |format|
      format.html { redirect_to admin_consent_forms_url, notice: 'Consent form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consent_form
      @consent_form = Admin::ConsentForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consent_form_params
      params.require(:admin_consent_form).permit(:content, :title, :name, :deleted)
    end
end
