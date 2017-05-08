class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform notification
    # html = ApplicationController.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}",
    #   locals: {notification: notification}, formats: [:html]
    data = ApplicationController.render partial: "layouts/notifications",
      locals: {user: notification.recipient}, formats: [:html]
    ActionCable.server.broadcast "notifications:#{notification.recipient_id}",
      data: data, user_id: notification.recipient_id
  end
end
