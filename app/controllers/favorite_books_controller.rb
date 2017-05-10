class FavoriteBooksController < ApplicationController
  load_and_authorize_resource only: :destroy

  def create
    @book = Book.find_by id: params[:book_id]
    current_user.favorite_books.create book: @book
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @book = @favorite_book.book
    @favorite_book.destroy
    respond_to do |format|
      format.js
    end
  end
end
