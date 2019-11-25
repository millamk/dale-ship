Rails.application.routes.draw do
	devise_for :users, controllers: {
		registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'pages#home'

  resources :shipper, only: [:new, :create]
  resources :carrier, only: [:new, :create]

  namespace :shipper do
    resources :freights, only: [:index]
  end

  namespace :carriers do
    resources :freights
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
