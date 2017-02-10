class BooksController < ApplicationController
  def index
    @categories = Category.all
    @books = Book.search params[:search_param], params[:category_id]
  end

  def show
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = t "flash.danger.book_not_found"
      redirect_to books_path
    end
  end
end
