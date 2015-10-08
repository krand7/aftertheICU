class ResponseValue < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  belongs_to :response
  belongs_to :answer_option
  belongs_to :answer_template

  # Validations
  # Callback
  # Other macros
  # Concerns
  # Named scopes
  # Methods
  def value
    answer_template.data_type
  end
end
