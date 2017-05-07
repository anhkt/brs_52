class BooksController < ApplicationController
  load_and_authorize_resource

  def show
    @reviews = @book.reviews
  end
end
