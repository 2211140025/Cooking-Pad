Rails.application.routes.draw do
  get 'top/logout'
  post 'top/login_form'
  get 'top/main'
  resource :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.

  # Defines the root path route ("/")
  # root "posts#index"
  root 'top#login_form'
end
