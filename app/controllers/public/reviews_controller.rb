class Public::ReviewsController < ApplicationController
  
  def index
    # フィルタ設定
    filter = params[:filter]
    
    # フィルタ設定が存在するか判定
    unless filter.nil?
      # 「すべて」が選択された場合、すべてのレコードを取得
      if filter == "all"
        @reviews = Review.where(post_id: params[:post_id]).page(params[:page]).per(10)
      # 「ポジティブなレビューのみ」が選択された場合、レートが2.5以上かつ感情スコアが0以上のレコードを取得
      elsif filter == "positive"
        @reviews = Review.where(post_id: params[:post_id], rate: 2.5..., emotion_score: 0...).page(params[:page]).per(10)
      # 「ネガティブなレビューのみ」が選択された場合、レートが2.5未満かつ感情スコアが0未満のレコードを取得
      elsif filter == "negative"
        @reviews = Review.where(post_id: params[:post_id], rate: ...2.5).page(params[:page]).per(10)
      end
    
    # フィルタ設定が存在しない場合は、投稿に関連する投稿をすべて取得し、ソートする
    else
      @reviews = Review.where(post_id: params[:post_id]).page(params[:page]).per(10).order(params[:sort])
    end
    
    @review_report = ReviewReport.new
    @post = Post.find(params[:post_id])
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
    # redirect_to new_review_path(sort: "created_at desc")
  end
  
  def destroy
    if Review.find(params[:id]).destroy
      flash[:notice] = "削除に成功しました"
      redirect_to my_review_path(sort: "created_at desc")
      
    else
      flash.now[:alert] = "削除に失敗しました"
      render "my_review"
    end
  end
  
  def my_review
    # byebug
    # フィルタ設定
    filter = params[:filter]
    
    # フィルタ設定が存在するか判定
    unless filter.nil?
      # 「すべて」が選択された場合、すべてのレコードを取得
      if filter == "all"
        @reviews = Review.where(user_id: current_user.id).page(params[:page]).per(10)
      # 「ポジティブなレビューのみ」が選択された場合、レートが2.5以上かつ感情スコアが0以上のレコードを取得
      elsif filter == "positive"
        @reviews = Review.where(user_id: current_user.id, rate: 2.5..., emotion_score: 0...).page(params[:page]).per(10)
      # 「ネガティブなレビューのみ」が選択された場合、レートが2.5未満かつ感情スコアが0未満のレコードを取得
      elsif filter == "negative"
        @reviews = Review.where(user_id: current_user.id, rate: ...2.5).page(params[:page]).per(10)
      end
    
    # フィルタ設定が存在しない場合は、自身のすべてのレビューを取得しソートする
    else
      @reviews = Review.where(user_id: current_user.id).page(params[:page]).per(10).order(params[:sort])
    end
  end
  
  private
  
  def review_params
    params.require(:review).permit(:rate, :comment)
  end
  
end
