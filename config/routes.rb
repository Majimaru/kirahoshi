Rails.application.routes.draw do
  
  namespace :admin do
    get 'maintenances/master_tables'
  end
  namespace :admin do
    get 'contacts/show'
    get 'contacts/index'
  end
  # namespace :public do
  #   get 'contacts/new'
  # end
  # namespace :admin do
  #   get 'review/show'
  # end
  # namespace :admin do
  #   get 'postss/show'
  # end
  # namespace :admin do
  #   get 'review_reports/index'
  # end
  # namespace :admin do
  #   get 'post_reports/index'
  # end
  # namespace :public do
  #   get 'review_reports/create'
  # end
  # namespace :public do
  #   get 'post_reports/create'
  # end
  # namespace :public do
  #   get 'reviews/new'
  #   get 'reviews/index'
  # end
  # namespace :admin do
  #   get "users/index"
  # end
  
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
    
    get   "users/mypage"          => "users#show",           as: "mypage"
    get   "users/profile/edit"    => "users#profile_edit",   as: "profile_edit"
    patch "users/profile"         => "users#profile_update", as: "profile_update"
    patch "users/account_delete"  => "users#withdrawal",     as: "account_delete"
    get   "users/ranking"         => "users#ranking"
    
    resources :posts, only: [:new, :index, :create, :destroy] do
      resource :reviews,      only: [:create]
      resource :post_reports, only: [:create], as: "report"
    end
    get "/posts/:post_id/reviews" => "reviews#index", as: "post_review_index"
    
    resources :reviews, only: [:new, :destroy] do
      resource :review_reports, only: [:create], as: "report"
    end
    get "/reviews/my_review" => "reviews#my_review", as: "my_review"
    
    resources :contacts, only: [:new, :create]
    
    get "/searches/keyword" => "searches#keyword_search"
    get "/searches/genre"   => "searches#genre_search"
    get "/searches/tag/:id" => "searches#tag_search", as: "tag_search"
  end
  
  
  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :users,    only: [:index, :show, :update]
    resources :posts,    only: [:destroy]
    resources :reviews,  only: [:destroy]
    resources :contacts, only: [:index, :show, :update]
    
    resources :post_reports, only: [:index, :update] do
      resources :posts, only: [:show]
    end
    
    resources :review_reports, only: [:index, :update] do
      resources :reviews, only: [:show]
    end
    
    get "/maintenances/master_tables"         => "maintenances#master_tables",         as: "master_tables"
    get "/maintenances/admin_table"           => "maintenances#admin_table",           as: "admin_table"
    get "/maintenances/level_setting_table"   => "maintenances#level_setting_table",   as: "level_setting_table"
    get "/maintenances/genre_table"           => "maintenances#genre_table",           as: "genre_table"
    
    post "/maintenances/admins"         => "maintenances#admin_create",         as: "admins"
    post "/maintenances/level_settings" => "maintenances#level_setting_create", as: "level_settings"
    post "/maintenances/genres"         => "maintenances#genre_create",         as: "genres"
    
    get "/maintenances/level/:id/edit"   => "maintenances#level_edit",   as: "level_edit"
    
    patch "/maintenances/level/:id" => "maintenances#level_update", as: "level_update"
    
    delete "/maintenances/admin/:id" => "maintenances#admin_destroy"
    delete "/maintenances/level/:id" => "maintenances#level_destroy", as: "level_destroy"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end