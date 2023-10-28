class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def index
    @posts = Post.where(user_id: current_user.id).page(params[:page]).per(10)
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
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:message, :post_image, :genre_id, :review_item)
  end
  
end
