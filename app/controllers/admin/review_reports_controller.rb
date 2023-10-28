class Admin::ReviewReportsController < ApplicationController
  
  def index
    @reports = ReviewReport.all.page(params[:page]).per(3)
  end
  
  def update
    report = ReviewReport.find(params[:id])
    # 通報ステータスを対応済みに更新する
    report.update(status: "responded")
    
    redirect_to admin_review_reports_path
  end
  
end
