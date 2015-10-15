class AdminController < ApplicationController
  before_action :authenticate_admin!

  def users
    @users = User.current.order(current_sign_in_at: :desc)
  end

  def user_detail
    @user = User.find(params[:id])
  end

  def dashboard
  end
end
