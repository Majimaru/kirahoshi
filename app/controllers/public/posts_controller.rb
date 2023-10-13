class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def index
  end

  def show
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to new_post_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      @post = Post.new
      render "new"
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:message)
  end
  
end
