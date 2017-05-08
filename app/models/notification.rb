class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: User.name
  belongs_to :notifiable, polymorphic: true

  after_commit -> {NotificationRelayJob.perform_later(self)}
  after_create :update_seen_noti

  private

  def update_seen_noti
    self.recipient.update_attributes seen_noti: true,
      number_noti: self.recipient.number_noti + 1
  end
end
