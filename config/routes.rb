Rails.application.routes.draw do
  
  namespace :admin do
    get 'users/index'
  end
  
  # ユーザー用
  devise_for :users,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

  scope module: :public do
    # devise_for :users, skip: [:passwords]
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :posts, only: [:new, :index, :show, :create, :destroy]
  end
  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  
  namespace :admin do
    # devise_for :admin, skip: [:registrations, :passwords]
    resources :users, only: [:index]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end