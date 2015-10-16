class Post < ActiveRecord::Base
  # Default Scope
  # Constants
  STATUS = [['Approved', 'approved'], ['Pending Review', 'pending_review'], ['Marked as Spam', 'spam'], ['Hidden', 'hidden']]

  # Attribute related macros
  # Associations
  belongs_to :topic
  belongs_to :user

  # Validations
  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  scope :most_recent, -> { current.where(status: 'approved').order(:created_at) }

  # Methods
  def is_first_post?
    self.topic.posts.first == self
  end

  def unapproved?
    status != 'approved'
  end
end
