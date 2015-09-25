class ResearchTopic < ActiveRecord::Base
  # Model attributes
  STATUS = [['Approved', 'approved'], ['Pending Review', 'pending_review'], ['Marked as Spam', 'spam'], ['Hidden', 'hidden']]

  # Concerns
  include Deletable

  # Model Relationships
  belongs_to :user
  has_many :comments, -> { current }
  has_many :votes, -> { current }

  # Model Validations
  validates_presence_of :name, :description, :slug, :user_id
  validates_uniqueness_of :slug, scope: [:deleted]
  validates_format_of :slug, with: /\A(?!\Anew\Z)[a-z][a-z0-9\-]*\Z/, message: "The format of the slug is invalid."

  # Model Scopes
  scope :approved, -> { current.where(progress: 'approved') }
  scope :newest, -> { approved.order("created_at desc") }
  scope :most_discussed, -> { approved.select("research_topics.*, count(comments.id) as comment_count").joins(:comments).group(group_columns).order("comment_count desc") }

  # Model Methods
  def add_comment(user, comment)
    comments.where(user_id: user.id, description: comment).create
  end

  def voted_by_user?(user = nil)
    return user.present? ? votes.where(user_id: user.id).present? : false
  end

  def endorsed_by_user?(user = nil)
    return voted_by_user?(user) ? votes.where(user_id: user.id, rating: 1).present? : false
  end

  def opposed_by_user?(user = nil)
    return voted_by_user?(user) ? votes.where(user_id: user.id, rating: 0).present? : false
  end

  def total_rating
    (votes.where(rating: 1).count*100)/votes.count
  end

  private

  def self.group_columns
    column_names.map{|cn| "research_topics.#{cn}"}.join(", ")
  end
end
