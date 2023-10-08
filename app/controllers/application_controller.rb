class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end
  
  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
    
    when User
      user_path(current_user)
    when Admin
      root_path
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
  
end
