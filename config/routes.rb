Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
    collection do
      get :search
    end
  end
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  #中間テーブルから先にある、
  #フォロー中のユーザとフォローされているユーザ一覧を表示するページ
  resources :favorites, only: [:create, :destroy]
  #member＝特定のデータに対するアクション

    
end