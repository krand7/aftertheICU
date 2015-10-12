class Survey < ActiveRecord::Base
  # Default Scope
  # Constants
  STATUS = ['show', 'hide']
  # Attribute related macros
  # Associations
  belongs_to :user
  has_many :response_sessions
  has_many :questions

  # Validations
  validates_presence_of :name, :slug, :status, :user_id
  validates_uniqueness_of :slug, scope: [ :deleted ]
  validates_format_of :slug, with: /\A(?!\Anew\Z)[a-z][a-z0-9\-]*\Z/
  validates_numericality_of :child_min_age, greater_than_or_equal_to: 0, less_than_or_equal_to: 8, if: :pediatric?
  validates_numericality_of :child_max_age, greater_than_or_equal_to: 0, less_than_or_equal_to: 8, if: :pediatric?

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  scope :pediatric, -> { where pediatric: true }

  # Methods
  def editable_by?(current_user)
    self.user_id == current_user.id
  end
end
