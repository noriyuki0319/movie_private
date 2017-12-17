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
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to post_path(@comment.post_id)
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
    #@comment.post_id = params[:post_id]
    @comment.destroy
    redirect_to post_path(@comment.post_id)
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:talk)
  end

end
