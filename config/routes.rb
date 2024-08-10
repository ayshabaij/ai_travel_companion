Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  unauthenticated :user do
    root 'home#index', as: :unauthenticated_root
  end

  resources :places, only: [:index, :show]
  resources :itineraries
  resource :profile, only: [:show, :edit, :update]
  resource :verification, only: [:new, :create] do
    collection do
      get :verify
      post :confirm
    end
  end
end
