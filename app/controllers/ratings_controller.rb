class RatingsController < ApplicationController
  before_action :find_book

  def create
    @rating = Rating.create rating_params
    respond_to do |format|
      format.js
    end
  end

  def update
    @rating = Rating.find_by id: params[:id]
    @rating.update_attributes rating_params
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
  end
end
