Rails.application.routes.draw do
  root to: 'offers#index'
  devise_for :users
  resources :offers, only: [:show, :new, :index, :create, :destroy]
  get 'dashboard', to: 'pages#dashboard'
end
