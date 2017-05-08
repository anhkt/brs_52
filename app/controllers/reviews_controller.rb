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
      if current_user.is_admin?
        create_notification
      end
    else
      flash[:alert] = flash_message "not_deleted"
    end
    redirect_to @review.book
  end

  private

  def review_params
    params.require(:review).permit Review::ATTRIBUTE_PARAMS
  end

  def create_notification
    Notification.create(recipient: @review.user, user: current_user,
        action: "banned", notifiable: @review)
  end
end
