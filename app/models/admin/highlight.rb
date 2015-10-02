class Admin::Highlight < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  mount_uploader :photo, PhotoUploader

  # Validations
  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
