class AnswerTemplate < ActiveRecord::Base
  # Default Scope
  # Constants
  TYPES = ["date", "radio", "checkbox", "string", "height", "number"]

  # Attribute related macros
  # Associations
  has_many :answer_options
  belongs_to :user
  belongs_to :question
  belongs_to :display_type
  belongs_to :parent_answer_template, class_name: "AnswerTemplate", foreign_key: "parent_answer_template_id"

  # Validations
  validates_presence_of :name, :user_id, :template_type
  validates_uniqueness_of :name, scope: [ :deleted ]
  validates_inclusion_of :template_type, in: TYPES
  validates_presence_of :parent_answer_template_id, if: :parent_answer_option_value_present?
  validates_presence_of :parent_answer_option_value, if: :parent_answer_template_present?
  validates_inclusion_of :parent_answer_option_value, in: :parent_template_option_values, if: :parent_answer_template_present?

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
  def allows_answer_options?
    self.template_type == 'radio' or self.template_type == 'checkbox'
  end

  def name_with_options
    "#{self.name} #{self.answer_options.pluck(:text, :value).collect{|text, value| "#{value}: #{text}"}.join(', ')}"
  end

  def parent_answer_option_value_present?
    self.parent_answer_option_value.present?
  end

  def parent_answer_template_present?
    self.parent_answer_template.present?
  end

  def parent_template_option_values
    if self.parent_answer_template
      self.parent_answer_template.answer_options.pluck(:value)
    else
      []
    end
  end

end
