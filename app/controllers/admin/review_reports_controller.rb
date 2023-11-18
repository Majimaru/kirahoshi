class Admin::ReviewReportsController < ApplicationController
  
  def index
    @reports = ReviewReport.order("created_at desc").page(params[:page]).per(10)
  end
  
  def update
    report = ReviewReport.find(params[:id])
    # 通報ステータスを対応済みに更新する
    report.update(status: "responded")
    
    redirect_to admin_review_reports_path
  end
  
end
