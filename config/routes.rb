Rails.application.routes.draw do
  get 'profiles/setup'
  get 'profiles/update_setup'
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

  resources :hobbies, only: [:index, :show] do
    resources :locations, only: [:index]
  end

  get 'profile/setup', to: 'profiles#setup', as: :profile_setup
  post 'profile/setup', to: 'profiles#update_setup'
end
