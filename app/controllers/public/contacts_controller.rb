class Public::ContactsController < ApplicationController
  
  def new
    @contact_new = Contact.new
  end
  
  def create
    @contact = current_user.contacts.new(contact_params)
    
    if @contact.save
      flash[:notice] = "お問い合わせいただき誠にありがとうございます"
      redirect_to new_contact_path
    else
      flash.now[:alert] = "送信に失敗しました"
      @contact_new = Contact.new
      render "new"
    end
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:classification, :message)
  end
  
end
