class Public::PostReportsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @report = current_user.post_reports.new(post_report_params)
    @report.post_id = @post.id
    
    if @report.save
      flash[:notice] = "通報に成功しました"
    
    else  
      flash[:alert] = "通報に失敗しました"
    end
  end
  
  private
  
  def post_report_params
    params.require(:post_report).permit(:reason)
  end
  
end
