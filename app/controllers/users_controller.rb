class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @favorite_books = @user.books
  end

  def update
    if current_user.update_attributes user_params
      flash[:success] = flash_message "updated"
      redirect_to current_user
    else
      respond_to do |f|
        f.html{user_path current_user}
        f.js{}
      end
    end
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit :email, :name, :password, :password_confirmation
  end
end
