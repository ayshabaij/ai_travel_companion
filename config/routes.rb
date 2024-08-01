Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :places, only: [:index, :show]
  resources :itineraries
  resource :profile, only: [:show, :edit, :update]
end
