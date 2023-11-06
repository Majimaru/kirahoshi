class Public::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.where(post_id: params[:post_id]).page(params[:page]).per(10)
    @review_report = ReviewReport.new
  end
  
  def new
    @review = Review.new
    @post_report = PostReport.new
    @posts = Post.where.not(user_id: current_user.id).page(params[:page]).per(10).order(params[:sort])
    @tags = Tag.all
  end

  def create
    @post = Post.find(params[:post_id])
    # Google Natural Language APIから感情スコアを取得
    score = Language.get_data(review_params[:comment])
    
    # Reviewテーブルに既にレコードが存在していれば更新、存在しなければ登録
    if @post.reviewed_by?(current_user)
      Review.find_by(user_id: current_user.id, post_id: @post.id).update(review_params)
      # 感情スコアを更新
      Review.find_by(user_id: current_user.id, post_id: @post.id).update(emotion_score: score)
      
    else
      review = current_user.reviews.new(review_params)
      review.post_id = @post.id
      review.emotion_score = score
      review.save
    end
    
    @post.update(average_rate: @post.get_average_rate)
  end
  
  private
  
  def review_params
    params.require(:review).permit(:rate, :comment)
  end
  
end
