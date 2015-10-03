class Admin::ContentGroup < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  has_many :content_pages, -> { current }

  # Validations
  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
