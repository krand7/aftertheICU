class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def dashboard
  end

  def users
    @users = User.current.order(current_sign_in_at: :desc)
  end

  def user_detail
    @user = User.find(params[:id])
  end

  def research_topics
    @research_topics = ResearchTopic.current.order(progress: :desc, created_at: :desc)
  end

  def social_media_content
  end
end
