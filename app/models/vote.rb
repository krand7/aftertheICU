class Vote < ActiveRecord::Base
  # Concerns
  include Deletable

  # Model Relationships
  belongs_to :user
  belongs_to :research_topic
end
