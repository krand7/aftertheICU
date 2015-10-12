class ResponseSession < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  belongs_to :survey
  belongs_to :user
  has_many :responses

  # Validations
  validates_presence_of :survey_id, :encounter
  validates_uniqueness_of :survey_id, scope: [:encounter, :user_id, :child_id, :deleted]

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
