class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  # Concerns
  include Deletable

  # Uploaders
  mount_uploader :photo, PhotoUploader

  # Model Relationships
  has_many :forums
  has_many :topics
  has_many :posts
  has_many :research_topics
  has_many :comments
  has_many :votes
  has_many :response_sessions
  has_many :responses
  has_many :surveys, -> { where deleted: false }
  has_many :questions, -> { where deleted: false }
  has_many :answer_templates, -> { where deleted: false }
  has_many :answer_options, -> { where deleted: false }

  # Model Validation
  validates_presence_of :first_name, :last_name
  validates :forum_name, allow_blank: false, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/i }

  # User Methods
  def admin?
    self.system_admin?
  end

  ## Leaderboard
  def points
    posts.current.count * ENV['pp_post'].to_i + topics.current.count * ENV['pp_topic'].to_i
  end

  ## Settings
  def photo_url
    if photo.present?
      photo.url
    else
      'default-user.jpg'
    end
  end

  def name
    first_name + ' ' + last_name
  end

  ## Surveys
  def editable_surveys
    Survey.current.where(user_id: self.id)
  end

  def get_baseline_survey_response_session(survey)
    response_sessions.where(encounter: 'baseline', survey_id: survey.id, child_id: nil).first_or_create
  end

  # Overriding Devise built-in active_for_authentication? method
  def active_for_authentication?
    super and not self.deleted?
  end

  def destroy
    super
    update_column :updated_at, Time.now
  end
end
