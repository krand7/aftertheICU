class Admin::ConsentForm < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  # Validations
  validates :title, presence: true
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
