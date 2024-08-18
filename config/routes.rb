Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

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

  # Trip routes
  get 'trip/start_date', to: 'trips#start_date'
  post 'trip/save_start_date', to: 'trips#save_start_date'

  get 'trip/end_date', to: 'trips#end_date'
  post 'trip/save_end_date', to: 'trips#save_end_date'

  get 'trip/address', to: 'trips#address'
  post 'trip/save_address', to: 'trips#save_address'

  get 'trip/budget', to: 'trips#budget'
  post 'trip/save_budget', to: 'trips#save_budget'

  get 'trip/prompt', to: 'trips#show_prompt', as: :trip_prompt

  # Chatbot Routes
  get '/chatbot', to: 'pages#chatbot'
  post '/chatbot/submit', to: 'pages#submit_chat'
  get '/pages/step1', to: 'pages#step1'
  get '/pages/step2', to: 'pages#step2'

  get 'invalid_location', to: 'trips#invalid_location', as: 'invalid_location'
  get 'error_page', to: 'trips#error_page', as: 'error_page'
end
