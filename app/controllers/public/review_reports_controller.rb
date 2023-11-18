class Public::ReviewReportsController < ApplicationController
  
  def create
    @review = Review.find(params[:review_id])
    @report = current_user.review_reports.new(review_report_params)
    @report.review_id = @review.id
    
    if @report.save
      flash[:notice] = "通報に成功しました"
    
    else  
      flash[:alert] = "通報に失敗しました"
    end
  end
  
  private
  
  def review_report_params
    params.require(:review_report).permit(:reason)
  end
  
end
