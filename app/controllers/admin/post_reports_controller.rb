class Admin::PostReportsController < ApplicationController
  
  def index
    @reports = PostReport.all.page(params[:page]).per(10)
  end
  
  def update
    report = PostReport.find(params[:id])
    # 通報ステータスを対応済みに更新する
    report.update(status: "responded")
    
    redirect_to admin_post_reports_path
  end
  
end
