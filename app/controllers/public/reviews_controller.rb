class Public::ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @posts = Post.where.not(user_id: current_user.id)
  end

  def index
  end
  
  def create
    
  end
  
end
