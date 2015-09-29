class Question < ActiveRecord::Base
  # Default Scope
  # Constants
  DISPLAY_TYPES = ["custom_date_input", "radio_input", "checkbox_input", "height_input", "number_input", "radio_input_multiple"]

  # Attribute related macros
  # Associations
  belongs_to :user
  has_many :answer_templates, -> { current.order("answer_templates.created_at asc") }
  has_many :answers

  # Validations
  validates_presence_of :text, :slug, :user_id
  validates_uniqueness_of :slug, scope: [ :deleted ]
  validates_format_of :slug, with: /\A(?!\Anew\Z)[a-z][a-z0-9\-]*\Z/

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
