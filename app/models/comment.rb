class Comment < ActiveRecord::Base
  # Model attributes
  STATUS = [['Approved', 'approved'], ['Pending Review', 'pending_review'], ['Marked as Spam', 'spam'], ['Hidden', 'hidden']]

  # Concerns
  include Deletable

  # Model Relationships
  belongs_to :user
  belongs_to :research_topic
end
