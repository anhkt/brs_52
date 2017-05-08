class UpdateNotification::UsersController < ApplicationController
  def update
    current_user.update_attributes seen_noti: false, number_noti: 0
    respond_to do |format|
      format.js
    end
  end
end
