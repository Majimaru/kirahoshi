class Admin::ReviewsController < ApplicationController
  
  def show
    @review = Review.find(params[:id])
    @report = ReviewReport.find(params[:review_report_id])
  end
  
  def destroy
    # byebug
    Review.find(params[:id]).destroy
    redirect_to admin_review_reports_path
  end
  
end
