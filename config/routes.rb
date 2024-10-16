Rails.application.routes.draw do
  root "users#index"

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :budgets, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :transactions, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :receipt_items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
