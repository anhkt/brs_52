class ReviewsController < ApplicationController
  load_and_authorize_resource
  load_resource :book, only: [:new, :create]

  def new
    @rating = @review.build_rating
  end

  def create
    @rating = @review.rating || @review.build_rating
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

    @user_book =
      if current_user.mark_book? @review.book
        current_user.user_books.find_by book: @review.book
      else
        current_user.user_books.new book: @review.book
      end
  end

  def edit
    @rating = @review.rating
  end

  def update
    @rating = @review.rating || @review.build_rating
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
    redirect_to root_path
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
