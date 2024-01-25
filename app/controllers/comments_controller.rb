class CommentsController < ApplicationController
  before_action :set_post_and_user
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])

    if @comment.destroy
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully deleted.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Error deleting comment.'
    end
  end

  private

  def set_post_and_user
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
