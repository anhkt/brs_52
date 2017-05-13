class CategoriesController < ApplicationController
  load_and_authorize_resource

  def show
    @books = @category.books.order_by_time.page(params[:page]).per_page 8
    if @books.size > 0
      @best_book = @books.book_challenge.first
      @user_book =
        if current_user.mark_book? @best_book
          current_user.user_books.find_by book: @best_book
        else
          current_user.user_books.new book: @best_book
        end
    end
    @categories = Category.all
  end
end
