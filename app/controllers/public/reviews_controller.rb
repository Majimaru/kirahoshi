class Public::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.where(post_id: params[:post_id]).page(params[:page]).per(10)
    @review_report = ReviewReport.new
  end
  
  def new
    @review = Review.new
    @post_report = PostReport.new
    @posts = Post.where.not(user_id: current_user.id).page(params[:page]).per(10)
  end

  def create
    @post = Post.find(params[:post_id])
    
    # Reviewテーブルに既にレコードが存在していれば更新、存在しなければ登録
    if @post.reviewed_by?(current_user)
      Review.find_by(user_id: current_user.id, post_id: @post.id).update(review_params)
    else
      review = current_user.reviews.new(review_params)
      review.post_id = @post.id
      review.save
    end
  end
  
  private
  
  def review_params
    params.require(:review).permit(:rate, :comment)
  end
  
end
