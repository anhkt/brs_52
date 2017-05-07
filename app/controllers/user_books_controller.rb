class UserBooksController < ApplicationController
  load_and_authorize_resource

  def create
    respond_to do |format|
      @user_book.save
      format.js
    end
  end

  def update
    respond_to do |format|
      @user_book.update_attributes user_book_params
      format.js
    end
  end

  private

  def user_book_params
    params.require(:user_book).permit UserBook::ATTRIBUTE_PARAMS
  end
end
