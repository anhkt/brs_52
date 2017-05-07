class BooksController < ApplicationController
  load_and_authorize_resource

  def show
    @reviews = @book.reviews
    @user_book =
      if current_user.mark_book? @book
        current_user.user_books.find_by book: @book
      else
        current_user.user_books.new book: @book
      end
  end
end
