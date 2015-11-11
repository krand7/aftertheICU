class SessionsController < Devise::SessionsController

  protected

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      dashboard_path
    else
      stored_location_for(resource) || request.referer || dashboard_path
    end
  end
end
