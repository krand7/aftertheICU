class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:dashboard]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin!
    redirect_to root_path, alert: "You do not have sufficient privileges to access that page." unless current_user.system_admin?
  end

  def dashboard
    @highlights = Admin::Highlight.where(displayed: true).first(3)
  end

  def team
    @team_members = Admin::TeamMember.order('position')
  end

  def partners
    @partners = Admin::Partner.order('position')
  end

  def privacy_policy
    @privacy_policy = Admin::ConsentForm.find_by_name('privacy_policy')
    redirect_to root_path and return if @privacy_policy.blank?
  end

  def empty_response_or_root_path(path = root_path)
    respond_to do |format|
      format.html { redirect_to path }
      format.js { render nothing: true }
      format.json { head :no_content }
      format.text { render nothing: true }
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
    end

end
