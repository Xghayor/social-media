class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
    @post.update(comments_counter:0, likes_counter: 0)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end
  

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
