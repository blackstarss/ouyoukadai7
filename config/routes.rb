Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  resources :books
  
  get "/home/about" => "homes#about"
  resources :users


end
