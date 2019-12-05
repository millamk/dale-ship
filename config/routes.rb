Rails.application.routes.draw do
  devise_for :users

  namespace :shippers do
    resources :freights, only: [:index]
    resource :profile, only: %i[edit update show]
    resources :bookings, only: [:index, :show]
  end

  namespace :carriers do
    get 'home', to: 'profiles#home'
    resources :freights, only: %i[index new create show edit update destroy]
    resource :profile, only: %i[edit update show]
    resources :bookings, only: [:index, :edit, :update]
  end

  resources :freights, only: [] do
    resources :bookings, only: [:create]
  end
  resources :roles, only: %i[new create]

  get :search, to: 'pages#search'

  root to: 'pages#home'

  # get '/404', to: 'errors#not_found'
  # get '/422', to: 'errors#unacceptable'
  # get '/500', to: 'errors#server_error'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
