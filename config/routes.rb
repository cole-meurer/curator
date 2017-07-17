Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :dashboard do
    resources :courses do
      resources :books, except: [:show]
    end
  end

  resources :books, only: [:show] do
    resources :conversations do
      resources :posts, shallow: true, except: :show
    end
  end

  get '/dashboard', to: 'pages#dashboard'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
