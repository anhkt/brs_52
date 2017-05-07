class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index

  end

  def destroy
    @user.destroy
    redirect_to users_path
  end
end
