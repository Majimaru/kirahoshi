class Users::SessionsController < Devise::SessionsController
  
  # ゲストユーザーでログインする
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to mypage_path, notice: "ゲストでログインしました。"
  end
  
end