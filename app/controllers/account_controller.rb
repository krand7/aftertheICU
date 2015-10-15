class AccountController < ApplicationController
  before_action :authenticate_user!

  def settings
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to :settings, notice: 'Your settings have been successfully saved.' }
        format.json { render :show, status: :updated, location: :settings }
      else
        format.html { render :settings, notice: 'There was an error saving your settings.'  }
        format.json { render :settings, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:photo, :forum_name, :gender, :birthdate)
  end
end
