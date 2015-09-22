class Topic < ActiveRecord::Base
  # Model Attributes
  STATUS = [['Approved', 'approved'], ['Pending Review', 'pending_review'], ['Marked as Spam', 'spam'], ['Hidden', 'hidden']]

  # Concerns
  include Deletable

  # Model Relationships
  belongs_to :forum
  belongs_to :user
  has_many :posts, -> { current }

  # Methods
  def increase_view_count
    update(views_count: views_count + 1)
  end
end
