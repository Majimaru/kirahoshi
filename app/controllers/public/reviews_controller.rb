class Public::ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @posts = Post.where.not(user_id: current_user.id)
  end

  def index
  end
  
  def create
    @post = Post.find(params[:post_id])
    rate = params[:review][:rate]
    
    # Reviewテーブルに既にレコードが存在していれば更新、存在しなければ登録
    if @post.reviewed_by?(current_user)
      Review.find_by(user_id: current_user.id, post_id: @post.id).update(rate: rate)
    else
      review = current_user.reviews.new(post_id: @post.id, rate: rate)
      review.save
    end
    
    redirect_to new_review_path
  end
  
  private
  
  def review_params
    params.require(:review).permit(:rate)
  end
  
end
