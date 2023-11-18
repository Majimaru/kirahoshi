class Admin::ContactsController < ApplicationController
  
  def index
    @contacts = Contact.order("created_at desc").page(params[:page]).per(10)
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def update
    contact = Contact.find(params[:id])
    # 確認ステータスを確認済みに更新する
    contact.update(confirmation_status: "confirmed")
    
    redirect_to admin_contacts_path
  end
  
end
