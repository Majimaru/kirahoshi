class Public::SearchesController < ApplicationController
  
  def genre_search
    @genre_id = params[:genre_id]
    
    if @genre_id.blank?
      @posts = Post.where.not(user_id: current_user.id).page(params[:page]).per(10)
    else
      @posts = Post.where(genre_id: @genre_id).where.not(user_id: current_user.id).page(params[:page]).per(10)
    end
    
    @review = Review.new
    @post_report = PostReport.new
    
    render template: "public/reviews/new"
  end
  
end
