class AnswerTemplate < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  has_many :answer_options
  belongs_to :user
  belongs_to :question
  belongs_to :display_type
  belongs_to :parent_answer_template, class_name: "AnswerTemplate", foreign_key: "parent_answer_template_id"

  # Validations
  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
