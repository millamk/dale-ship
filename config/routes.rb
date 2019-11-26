Rails.application.routes.draw do

  namespace :carriers do
    get 'profiles/edit'
  end
  namespace :shippers do
    get 'profiles/edit'
  end
  devise_for :users
  root to: 'pages#home'

  namespace :shippers do
    resources :freights, only: [:index]
    resource :profile, only: %i[edit update]
  end

  namespace :carriers do
    resources :freights, only: %i[index new create show]
    resource :profile, only: %i[edit update]
  end

  resources :roles, only: %i[new create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
