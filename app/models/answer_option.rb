class AnswerOption < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  belongs_to :user
  belongs_to :answer_template
  has_many :answer_values

  # Validations
  validates_presence_of :text, :hotkey, :value, :user_id
  validates_uniqueness_of :value, scope: [ :answer_template_id ]

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
