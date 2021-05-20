Rails.application.routes.draw do
  resources :carts
  resources :products
  resources :categories
  resources :users
  root 'home#index'
  get '/home', to: 'home#index'
  get '/login', to: 'home#login'
  post 'login', to:'home#login_post'
  # root 'topics#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
