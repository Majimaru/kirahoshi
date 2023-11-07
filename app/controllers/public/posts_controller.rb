class Public::PostsController < ApplicationController
  
  before_action :level_up, only: [:create]
  
  def new
    @post_new = Post.new
  end

  def index
    @posts = Post.where(user_id: current_user.id).page(params[:page]).per(10).order(params[:sort])
    @tags = Tag.all
  end

  def show
  end
  
  def create
    @post = current_user.posts.new(post_params)
    tags = params[:post][:name].split(",").map(&:strip).uniq
    
    if @post.save
      # タグを保存するためのメソッドを呼び出す
      @post.save_tags(tags)
      
      flash[:notice] = "投稿に成功しました"
      redirect_to new_post_path
      
    else
      flash.now[:alert] = "投稿に失敗しました"
      @post_new = Post.new
      render "new"
    end
  end
  
  def destroy
    if Post.find(params[:id]).destroy
      flash[:notice] = "削除に成功しました"
      redirect_to posts_path
      
    else
      flash.now[:alert] = "削除に失敗しました"
      render "index"
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:message, :post_image, :genre_id, :review_item)
  end
  
end
