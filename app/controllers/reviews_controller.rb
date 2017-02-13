class ReviewsController < ApplicationController
  before_action :logged_in_user

  def new
    @review = Review.new
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = t "flash.danger.book_not_found"
      redirect_to books_path
    end
  end

  def create
    @review = current_user.reviews.new review_params
    if @review.save
      flash[:success] = t "flash.success.create_review"
      redirect_to book_path @review.book_id
    else
      @book = Book.find_by id: params[:review][:book_id]
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit :rating, :content, :book_id, :user_id
  end
end
