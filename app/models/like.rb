class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true, touch: true

  after_create :create_notification

  private

  def create_notification
    unless self.likeable.user == self.user
      Notification.create(recipient: self.likeable.user, user: self.user,
        action: "liked", notifiable: self.likeable)
    end
  end
end
