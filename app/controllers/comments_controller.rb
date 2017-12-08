class CommentsController < ApplicationController
	  before_action :set_comment, only:[:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to comment_path(@comment.id)
  end

  def show
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to comment_path(@comment.id)
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  private
  def set_post
    @comment = Comment.find(params[:id])
  end

  def post_params
    params.require(:comment).permit(:talk, :user_id, :post_id)
  end

end
