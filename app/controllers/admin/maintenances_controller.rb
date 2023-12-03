class Admin::MaintenancesController < ApplicationController
  
  def master_tables
  end
  
  def admin_table
    @admins     = Admin.all
    @admin_new  = Admin.new
  end
  
  def level_setting_table
  end
  
  def genre_table
  end
  
  def tag_table
  end
  
  def admin_create
    # if Admin.find_by(email: params[:admin][:email])
    #   flash[:alert] = "存在します"
      
    # else
    #   flash[:alert] = "存在しません"
    # end
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "管理者の登録に成功しました"
      
      redirect_to admin_admin_table_path
      
    else
      flash.now[:alert] = "管理者の登録に失敗しました"
      @admins     = Admin.all
      @admin_new  = Admin.new
      
      render "admin_table"
    end
  end
  
  private
  
  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
  
end
