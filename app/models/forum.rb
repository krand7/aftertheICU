class Forum < ActiveRecord::Base
  # Concerns
  include Deletable

  # Model Relationships
  belongs_to :user
  has_many :topics
end
