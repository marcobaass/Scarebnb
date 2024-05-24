Rails.application.routes.draw do
  root to: 'offers#index'
  devise_for :users

  #get 'offers/index', to: 'offers#index', as: :offers
  #get 'offers/:id', to: "offers#show", as: :offer

  get "up" => "rails/health#show", as: :rails_health_check

  resources :offers, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    resources :bookings, only: [:create]
  end

  get 'dashboard', to: 'pages#dashboard'
end
