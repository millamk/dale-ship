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
    resources :bookings, only: [:index, :edit, :update, :show]
  end

  resources :freights, only: [] do
    resources :bookings, only: [:create]
  end
  resources :roles, only: %i[new create]

  get :search, to: 'pages#search'

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
