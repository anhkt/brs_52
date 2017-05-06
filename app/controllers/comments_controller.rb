class CommentsController < ApplicationController
  load_and_authorize_resource

  skip_load_resource only: :new

  def new
    @comment = Comment.new parent_id: params[:parent_id]
  end

  def create
    respond_to do |format|
      if params[:comment].has_key? :parent_id
        @parent = Comment.find_by_id(params[:comment].delete(:parent_id))
        @comment = @parent.children.build comment_params
      end
      @comment.save
      format.js
    end
  end

  def edit

  end

  def update
    @comment.update_attributes comment_params
  end

  def destroy
    respond_to do |format|
      @comment.destroy
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit Comment::ATTRIBUTE_PARAMS
  end
end
