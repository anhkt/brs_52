class Review < ApplicationRecord
  include RandomRecord

  paginates_per 8

  ATTRIBUTE_PARAMS = [:content, :book_id, :user_id,
    rating_attributes: [:id, :rating, :book_id, :user_id]]

  scope :order_by_created_at, -> {order updated_at: :desc}

  belongs_to :book, touch: true
  belongs_to :user

  has_one :rating, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, dependent: :destroy

  after_create :create_notification

  before_destroy :remove_notification

  accepts_nested_attributes_for :rating

  validates :content, presence: true
  validate :rating_must_present

  private
  def remove_notification
    Notification.where(notifiable: self).destroy_all
    comments = []
    comments += self.comments
    self.comments.each do |comment|
      comments += comment.children
    end
    Notification.where(notifiable: comments).destroy_all
  end

  def create_notification
    self.user.followers.each do |follower|
      Notification.create recipient: follower, user: self.user,
        action: "reviewed", notifiable: self.book
    end
  end

  def rating_must_present
    if rating[:rating].blank? || rating[:rating] == 0
      errors.add :rating, "must be present"
    end
  end
end
