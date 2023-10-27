class Public::PostReportsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @report = current_user.post_reports.new(post_report_params)
    @report.post_id = @post.id
    @report.save
  end
  
  private
  
  def post_report_params
    params.require(:post_report).permit(:reason)
  end
  
end
