class Public::SearchesController < ApplicationController
  
  def genre_search
    @genre_id = params[:genre_id]
    @tags = Tag.all
    # 遷移元の画面を設定
    view = params[:view]
    
    # 遷移元が投稿一覧画面の時
    if view == "post"
      if @genre_id.blank?
        @posts = Post.where(user_id: current_user.id).page(params[:page]).per(10).order("created_at desc")
        @serarch = ""
        
      else
        @posts = Post.where(user_id: current_user.id, genre_id: @genre_id).page(params[:page]).per(10).order("created_at desc")
        # 検索結果画面に表示する文字列を設定
        genre = Genre.select("name").where(id: @genre_id).first
        @search = "ジャンル :　" + genre.name.to_s
      end
      
      render template: "public/posts/index"
    
    # 遷移元がレビュー画面の時 
    elsif view == "review"
      if @genre_id.blank?
        @posts = Post.where.not(user_id: current_user.id).page(params[:page]).per(10).order("created_at desc")
        @serarch = ""
        
      else
        @posts = Post.where(genre_id: @genre_id).where.not(user_id: current_user.id).page(params[:page]).per(10).order("created_at desc")
        # 検索結果画面に表示する文字列を設定
        genre = Genre.select("name").where(id: @genre_id).first
        @search = "ジャンル :　" + genre.name.to_s
      end
      
      @review = Review.new
      @post_report = PostReport.new
      render template: "public/reviews/new"
    end
  end
  
  def tag_search
    tag = Tag.find(params[:id])
    @tags = Tag.all
    view = params[:view]
    
    if view == "post"
      # タグに紐づくログインユーザーの投稿を取得
      @posts = tag.posts.where(user_id: current_user.id).page(params[:page]).per(10).order(created_at: :desc)
      render template: "public/posts/index"
      
    elsif view == "review"
      # タグに紐づく投稿をすべて取得
      @posts = tag.posts.page(params[:page]).per(10).order(created_at: :desc)
      render template: "public/reviews/new"
    end
  end
  
end
