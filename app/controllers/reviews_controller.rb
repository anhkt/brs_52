class ReviewsController < ApplicationController
  load_and_authorize_resource
  load_resource :book, only: [:new, :create]

  def new
  end

  def create
    if @review.save
      flash[:success] = flash_message "created"
      redirect_to @review
    else
      flash[:alert] = flash_message "not_created"
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = flash_message "updated"
      redirect_to @review
    else
      flash[:alert] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @review.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:alert] = flash_message "not_deleted"
    end
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit Review::ATTRIBUTE_PARAMS
  end
end
