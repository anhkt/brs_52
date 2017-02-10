class Admins::BooksController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :find_book, only: :show

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @categories = Category.all
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "flash.success.book_create"
      redirect_to admins_book_path @book
    else
      @categories = Category.all
      render :new
    end
  end

  def show
  end

  private
  def book_params
    params.require(:book).permit :title, :author, :description, :publish_date,
      :number_of_pages, :image, :category_id
  end

  def find_book
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = t "flash.danger.book_not_found"
      redirect_to admins_books_path
    end
  end
end
