class Review < ApplicationRecord
  include RandomRecord

  ATTRIBUTE_PARAMS = [:content, :book_id, :user_id]

  belongs_to :book
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
  has_many :reports, dependent: :destroy

  before_destroy :remove_notification

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
end
