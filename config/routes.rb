Rails.application.routes.draw do
  root to: 'offers#index'
  devise_for :users

  #get 'offers/index', to: 'offers#index', as: :offers
  #get 'offers/:id', to: "offers#show", as: :offer

  get "up" => "rails/health#show", as: :rails_health_check

  resources :offers, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    resources :bookings, only: [:create]
    patch :accept
    patch :decline
  end

  get 'dashboard', to: 'pages#dashboard'
end

class AddStatusToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :status, :integer, default: 0, index: true
  end
end
