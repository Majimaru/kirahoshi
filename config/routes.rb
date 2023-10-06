Rails.application.routes.draw do
  
  # ユーザー用
  scope module: :public do
    devise_for :users, skip: [:passwords]
    root to: 'homes#top'
  end
  
  # 管理者用
  namespace :admin do
    devise_for :admins, skip: [:registrations, :passwords]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
