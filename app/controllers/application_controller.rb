class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:dashboard]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin!
    redirect_to root_path, alert: "You do not have sufficient privileges to access that page." unless current_user.system_admin?
  end

  def team
    @team_members = Admin::TeamMember.order('position')
  end

  def partners
    @partners = Admin::Partner.order('position')
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
    end

end
