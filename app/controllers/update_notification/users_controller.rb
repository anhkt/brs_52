class UpdateNotification::UsersController < ApplicationController
  def update
    current_user.update_attribute :seen_noti, false
    respond_to do |format|
      format.js
    end
  end
end
