class Admin::DashboardsController < ApplicationController
  before_action :load_day, only: :index

  def index
    review_by_day
    comment_by_day
    user_by_day
  end

  private

  def load_day
    end_date = Date.today
    start_date = end_date - 7.days

    @dates = (start_date..end_date).to_a
  end

  def review_by_day
    @review_by_day = []
    @dates.each do |date|
      count = 0
      Review.where("created_at > #{@dates.first}").each do |review|
        count += 1 if date.to_date == review.created_at.to_date
      end
      @review_by_day << count
    end
  end

  def comment_by_day
    @comment_by_day = []
    @dates.each do |date|
      count = 0
      Comment.where("created_at > #{@dates.first}").each do |comment|
        count += 1 if date.to_date == comment.created_at.to_date
      end
      @comment_by_day << count
    end
  end

  def user_by_day
    @user_by_day = []
    @dates.each do |date|
      count = 0
      User.where("created_at > #{@dates.first}").each do |user|
        count += 1 if date.to_date == user.created_at.to_date
      end
      @user_by_day << count
    end
  end
end
