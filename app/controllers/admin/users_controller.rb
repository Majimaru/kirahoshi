class Admin::UsersController < ApplicationController
  
  def index
    @users = User.order("created_at desc").page(params[:page]).per(10)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    
    if user.update(user_params)
      flash[:notice] = "会員ステータスの更新に成功しました"
      
    else
      flash[:alert] = "会員ステータスの更新に失敗しました"
    end
    
    redirect_to admin_user_path(user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:membership_status)
  end
  
end
