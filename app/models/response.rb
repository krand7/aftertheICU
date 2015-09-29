class Response < ActiveRecord::Base
  # Default Scope
  # Constants
  STATE = %(incomplete complete migrated locked)

  # Attribute related macros
  # Associations
  belongs_to :question
  belongs_to :response_session
  has_many :response_values, dependent: :destroy

  # Validations
  validates_presence_of :response_session_id, :question_id
  validates_uniqueness_of :question_id, scope: [:response_session_id]

  # Callback
  # Other macros
  # Concerns
  include DateAndTimeParser

  # Named scopes
  scope :incomplete,  -> { where state: 'incomplete' }
  scope :invalid,     -> { where state: 'invalid' }
  scope :migrated,    -> { where state: 'migrated' }
  scope :complete,    -> { where state: ['complete', 'locked'] }
  scope :locked,      -> { where state: 'locked' }

  # Methods
end
