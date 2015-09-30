Rails.application.routes.draw do

  root to: 'static_pages#home'
  get 'signup', to: 'users#new' #signupという名前でアクセスできるように
  get 'login', to:  'sessions#new'
  post   'login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'  
  
  get 'followings/:id', to: 'users#followings', as: 'followings'
  get 'followers/:id', to: 'users#followers', as: 'followers'
  
  get 'users_all', to: 'users#users_all', as: 'users_all'

  get 'inbox', to: 'users#inbox'
  get 'sendmail', to: 'users#sendmail'
  
  get 'words', to: 'words#show'
  
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  
  resources :mailboxes, only: [:create]

  # for Twitter login
  get "/auth/:provider/callback", to: "sessions#omniauth_callbacks"
  # fot Rakuten Recipe
  get "new", to: "words#new"
  

end