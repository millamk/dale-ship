Rails.application.routes.draw do
  devise_for :users

  namespace :shippers do
    resources :freights, only: [:index]
    resource :profile, only: %i[edit update show]
  end

  namespace :carriers do
    resources :freights, only: %i[index new create show edit update destroy]
    resource :profile, only: %i[edit update show]
  end

  resources :freights, only: [] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show]
  resources :roles, only: %i[new create]
 
  get :search, to: 'pages#search'

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
