class Public::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.where(user_id: current_user.id, post_id: params[:post_id])
  end
  
  def new
    @review = Review.new
    @post_report = PostReport.new
    @posts = Post.where.not(user_id: current_user.id)
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
    
    # redirect_to new_review_path
  end
  
  private
  
  def review_params
    params.require(:review).permit(:rate, :comment)
  end
  
end
