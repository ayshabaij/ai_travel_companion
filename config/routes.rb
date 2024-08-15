Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'profiles#setup', as: :authenticated_root
  end

  unauthenticated :user do
    root 'home#index', as: :unauthenticated_root
  end

  resources :welcome

  resource :profile, only: [:show, :edit, :update] do
    collection do
      get :setup
      post :update_setup
      get :setup_hobbies
      post :update_hobbies
      get :setup_dietary_restrictions
      post :update_dietary_restrictions
      get :setup_accessibility
      post :update_accessibility
    end
  end

  get 'profile/setup', to: 'profiles#setup', as: :profile_setup
  post 'profile/setup', to: 'profiles#update_setup'
end
