class Admin::PostsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    @report = PostReport.find(params[:post_report_id])
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_post_reports_path
  end
  
end
