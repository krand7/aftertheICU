json.array!(@research_topics) do |research_topic|
  json.extract! research_topic, :id, :name, :description, :deleted, :user_id, :progress
  json.url research_topic_url(research_topic, format: :json)
end
