Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :shipper do
    resources :freights, only: [:index]
  end

  namespace :carriers do
    resources :freights
  end

  resources :roles, only: %i[new create]

  resources :freights

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
