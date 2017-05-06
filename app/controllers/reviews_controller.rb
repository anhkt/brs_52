class ReviewsController < ApplicationController
  load_and_authorize_resource

  def show
    @comment = Comment.new
  end
end
