Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :shippers do
    resources :freights, only: [:index]
    resource :profile, only: %i[edit update show]
    get ':freight_id/bookings/new', to: 'bookings#new', as: 'new_booking'
    post ':freight_id/bookings', to: 'bookings#create', as: 'create_booking'
    resources :bookings, only: [:show]
  end

  namespace :carriers do
    resources :freights, only: %i[index new create show]
    resource :profile, only: %i[edit update show]
  end

  resources :roles, only: %i[new create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
