Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }

  root to: 'homes#top'
  get '/home/about' => "homes#about", as: 'about'
  resources :books
  delete 'books/:id' => 'books#destroy', as: 'destroy'
  
  resources :users


end
