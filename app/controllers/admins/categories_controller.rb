class Admins::CategoriesController < ApplicationController
  before_action :logged_in_user, :verify_admin

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      @categories = Category.all
      redirect_to admins_categories_path
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
