Rails.application.routes.draw do

  get 'items/create'

    devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

    devise_scope :user do
      get 'sign_in', to: 'devise/sessions#new'
    end

    resources :users do
      resources :items, only: [:create, :destroy]
    end

  get '/users' => 'users#show', as: :user_root

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
