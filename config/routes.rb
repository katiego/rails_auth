Rails.application.routes.draw do


  get "/profile", to: 'users#show'
  get "/signup", to: 'users#new'
  get "/login", to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'site#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

end
