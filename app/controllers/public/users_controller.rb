class Public::UsersController < ApplicationController
  
  before_action :ensure_guest_user, only: [:profile_edit, :profile_update, :withdrawal]
  
  def show
    @user = User.find(current_user.id)
    # アクティブレベルに対するしきい値を取得
    @thresold = LevelSetting.new.get_thresold(@user.active_level)
  end

  def profile_edit
    @user = User.find(current_user.id)
  end
  
  def profile_update
    @user = User.find(current_user.id)
    
    if @user.update(user_params)
      flash[:notice] = "プロフィールの更新に成功しました"
      redirect_to mypage_path
    else
      flash.now[:alert] = "プロフィールの更新に失敗しました"
      render "show"
    end
  end
  
  # アカウント削除
  def withdrawal
    @user = User.find(current_user.id)
    @user.update(membership_status: "withdrawal")
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:profile_image, :user_name)
  end
  
  # ログインユーザーがゲストか判定
  def ensure_guest_user
    @user = User.find(current_user.id)
    
    if @user.guest_user?
      redirect_to mypage_path, notice: "ゲストユーザーはこちらの操作を行うことが出来ません。"
    end
  end
end
