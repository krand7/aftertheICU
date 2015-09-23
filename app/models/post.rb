class Post < ActiveRecord::Base
  # Concerns
  include Deletable

  # Model Relationships
  belongs_to :topic
  belongs_to :user

  # Model Methods
  def is_first_post?
    self.topic.posts.first == self
  end
end
