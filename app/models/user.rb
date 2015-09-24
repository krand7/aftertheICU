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

  # Model Validation
  validates_presence_of :first_name, :last_name
  validates :forum_name, allow_blank: false, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/i }

  # User Methods
  def admin?
    self.system_admin?
  end

  def points
    posts.current.count * ENV['pp_post'].to_i + topics.current.count * ENV['pp_topic'].to_i
  end

  def photo_url
    if photo.present?
      photo.url
    else
      'default-user.jpg'
    end
  end

  def full_name
    first_name + last_name
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
