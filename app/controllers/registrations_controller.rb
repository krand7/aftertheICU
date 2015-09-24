class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_before_action :verify_authenticity_token, only: [ :create ]

  protected

  # def after_sign_up_path_for(resource)
  #   get_started_path
  # end

  private

  def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :over_eighteen, :email, :password, :forum_name)
  end

end
