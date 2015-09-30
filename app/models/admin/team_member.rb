class Admin::TeamMember < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  def photo_url
    if photo.present?
      photo.url
    else
      'default-user.jpg'
    end
  end
end
