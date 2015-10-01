class Admin::Partner < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  mount_uploader :photo, PhotoUploader

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :position, presence: true

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods

  def photo_url
    if photo.present?
      photo.url
    else
      'default-user.jpg'
    end
  end

end
