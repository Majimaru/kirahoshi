class Admin::MaintenancesController < ApplicationController
  
  def master_tables
  end
  
  def admin_table
    @admins     = Admin.order("created_at desc").page(params[:page]).per(10)
    @admin_new  = Admin.new
  end
  
  def level_setting_table
    @level_settings    = LevelSetting.order("created_at desc").page(params[:page]).per(10)
    @level_setting_new = LevelSetting.new
  end
  
  def genre_table
    @genres   = Genre.order("created_at desc").page(params[:page]).per(10)
    @genre_new = Genre.new
  end
  
  def admin_create
    @admin = Admin.new(admin_params)
    
    if @admin.save
      flash[:notice] = "管理者の登録に成功しました"
      
      redirect_to admin_admin_table_path
      
    else
      flash.now[:alert] = "管理者の登録に失敗しました"
      @admins     = Admin.order("created_at desc").page(params[:page]).per(10)
      @admin_new  = Admin.new
      
      render "admin_table"
    end
  end
  
  def level_setting_create
    LevelSetting.new(level_setting_params).save
    flash[:notice] = "レベル設定の登録に成功しました"
    
    redirect_to admin_level_setting_table_path
  end
  
  def genre_create
    Genre.new(genre_params).save
    flash[:notice] = "ジャンルの登録に成功しました"
    
    redirect_to admin_genre_table_path
  end
  
  def level_edit
    @level_setting = LevelSetting.find(params[:id])
  end
  
  def level_update
    level_setting = LevelSetting.find(params[:id])
    
    if level_setting.update(level_setting_params)
      flash[:notice] = "レベル設定情報の更新に成功しました"
      
    else
      flash[:notice] = "レベル設定情報の更新に失敗しました"
    end
    
    redirect_to admin_level_setting_table_path
  end
  
  def admin_destroy
    Admin.find(params[:id]).destroy
    flash[:notice] = "管理者の削除に成功しました"
    
    redirect_to admin_admin_table_path
  end
  
  def level_destroy
    LevelSetting.find(params[:id]).destroy
    flash[:notice] = "レベル設定の削除に成功しました"
    
    redirect_to admin_level_setting_table_path
  end
  
  private
  
  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
  
  def level_setting_params
    params.require(:level_setting).permit(:level, :thresold)
  end
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
