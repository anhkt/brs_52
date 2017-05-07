class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  after_create :create_notification

  private

  def create_notification
    Notification.create(recipient: self.likeable.user, user: self.user,
      action: "liked", notifiable: self.likeable)
  end
end
