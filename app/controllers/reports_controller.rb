class ReportsController < ApplicationController
  load_and_authorize_resource

  def create
    @report.save
    create_notification
    redirect_to :back
  end

  private

  def report_params
    params.require(:report).permit Report::ATTRIBUTE_PARAMS
  end

  def create_notification
    User.where(is_admin: true).each do |admin|
      Notification.create(recipient: admin, user: @report.user,
        action: "reported", notifiable: @report.review)
    end
  end
end
