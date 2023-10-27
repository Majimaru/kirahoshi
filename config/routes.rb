Rails.application.routes.draw do
  
  # namespace :public do
  #   get 'post_reports/create'
  # end
  # namespace :public do
  #   get 'reviews/new'
  #   get 'reviews/index'
  # end
  namespace :admin do
    get "users/index"
  end
  
  # ユーザー側
  devise_for :users,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: "public/sessions"
  }
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  scope module: :public do
    root to: "homes#top"
    resources :users, only: [:destroy]
    get "users/mypage" => "users#show", as: "mypage"
    get "users/profile/edit" => "users#profile_edit", as: "profile_edit"
    patch "users/profile" => "users#profile_update", as: "profile_update"
    
    resources :posts, only: [:new, :index, :show, :create, :destroy] do
      resource :reviews, only: [:create]
      resource :post_reports, only: [:create], as: "report"
    end
    
    get "/posts/:post_id/reviews" => "reviews#index", as: "post_review_index"
    
    resources :reviews, only: [:new] do
      resource :review_reports, only: [:create], as: "report"
    end
  end
  
  
  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :users, only: [:index]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end