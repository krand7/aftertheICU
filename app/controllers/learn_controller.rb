class LearnController < ApplicationController
  before_action :set_content_page, only: [:show]

  def index
    @content_groups = Admin::ContentGroup.current.order('position')
  end

  def show
  end

  private
  def set_content_page
    @content_page = Admin::ContentPage.find_by_slug(params[:content_page_slug])
  end
end
