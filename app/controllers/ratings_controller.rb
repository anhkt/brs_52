class RatingsController < ApplicationController
  before_action :find_book
  before_action :find_rating, only: [:update, :destroy]

  def create
    @rating = Rating.create rating_params
    @book.reload
    respond_to do |format|
      format.js
    end
  end

  def update
    @rating.update_attributes rating_params
    @book.reload
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @rating.destroy
    @book.reload
    @rating = current_user.ratings.build book_id: @book.id
    respond_to do |format|
      format.js
    end
  end

  private
  def rating_params
    params.require(:rating).permit Rating::ATTRIBUTE_PARAMS
  end

  def find_book
    @book = Book.find_by id: params[:book_id]
    redirect_to root_path unless @book
  end

  def find_rating
    @rating = Rating.find_by id: params[:id]
    redirect_to root_path unless @rating
  end
end
