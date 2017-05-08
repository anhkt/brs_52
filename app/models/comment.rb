class Comment < ApplicationRecord
  ATTRIBUTE_PARAMS = [:content, :review_id, :user_id]

  acts_as_tree order: "created_at DESC"

  belongs_to :review
  belongs_to :user

  has_many :likes, as: :likeable

  after_create :create_comments

  private

  def create_comments
    if self.review
      users = [self.review.user] + self.review.comments.map(&:user)
      users = users - [self.user]
      users.uniq.each do |recipient|
        Notification.create(recipient: recipient, user: self.user,
          action: "commented", notifiable: self)
      end
    else
      users = [self.parent.user] + self.parent.children.map(&:user)
      users = users - [self.user]
      users.uniq.each do |recipient|
        Notification.create(recipient: recipient, user: self.user,
          action: "replied", notifiable: self.parent)
      end
    end
  end
end
