class Post < ActiveRecord::Base
  # Concerns
  include Deletable

  # Model Relationships
  belongs_to :topic
  belongs_to :user
end
