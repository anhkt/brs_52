class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by id: params[:id]
    if @book.nil?
      flash[:danger] = t "flash.danger.book_not_exist"
      redirect_to books_path
    end
  end
end
