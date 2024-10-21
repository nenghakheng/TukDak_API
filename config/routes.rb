Rails.application.routes.draw do
  root 'application#index'

  # OmniAuth routes
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/auth/failure', to: redirect('/')

  # authentication routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
