class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # トップページを除き、URLに"/admin"が含まれていない、かつ、未ログインの場合にアクセス拒否
  before_action :authenticate_user!, except: [:top], unless: :admin_url
  # トップページを除き、URLに"/admin"が含まれている、かつ、未ログインの場合にアクセス拒否
  before_action :authenticate_admin!, except: [:top], if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end
  
  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
    
    when User
      mypage_path
      
    when Admin
      admin_users_path
    end
  end
  
  # ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected
  
  # サインアップ時、ユーザー名のデータ保存を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
  
  # 投稿またはレビューをした際に行うレベルアップ処理
  def level_up
    user = User.find(current_user.id)
    
    # ユーザーの現在の経験値に1ポイント加算する
    totalExp = user.experience_point + 1
    # 加算後の経験値を総経験値に反映させる
    user.update(experience_point: totalExp)
    
    # ユーザーのアクティブレベルより1高いレコードを取得
    level_setting = LevelSetting.find_by(level: user.active_level + 1)
    
    # ユーザーの総経験値がレベルアップの閾値を超えていれば、レベルアップを行う
    if level_setting.thresold <= user.experience_point
      user.active_level = user.active_level + 1
      user.update(active_level: user.active_level, experience_point: 0)
    end
  end
  
end