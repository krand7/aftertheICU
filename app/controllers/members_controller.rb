class MembersController < ApplicationController
  before_action :set_member, only: [:show]

  def index
    @members = User.current.where.not(forum_name: [nil, '']).order("LOWER(forum_name)")
  end

  def show
    @posts = @member.posts
  end

  def leaderboards
    @members = User.current.where.not(forum_name: [nil, '']).sort_by(&:points).reverse
  end

  private

  def set_member
    @member = User.find_by_forum_name(params[:forum_name])
  end
end
