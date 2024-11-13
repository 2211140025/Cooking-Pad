Rails.application.routes.draw do
  get 'top/logout'
  post 'top/login'
  resource :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
  resources :users
  resources :recipes
  resources :categories
  
  get 'search', to: 'recipes#search' # 文字検索
  get 'image_search', to: 'recipes#image_search' # 画像類似検索
end
