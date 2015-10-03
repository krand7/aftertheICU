class Admin::ContentPage < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  belongs_to :content_group
  mount_uploader :photo, PhotoUploader

  # Validations
  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
