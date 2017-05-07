class NotificationsController < ApplicationController
  load_and_authorize_resource, only: :update

  def index
    @notifications = current_user.notifications.order created_at: :desc
  end

  def update
    @notification.update_attributes notification_params
  end

  private

  def notification_params
    params.require(:notification).permit :seen
  end
end
