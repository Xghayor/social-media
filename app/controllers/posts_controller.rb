class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user

  def index
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(params[:user_id])

    if @post.destroy
      redirect_to user_posts_path(@user), notice: 'Post was successfully deleted.'
    else
      redirect_to user_posts_path(@user), alert: 'Error deleting post.'
    end
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
