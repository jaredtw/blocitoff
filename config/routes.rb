Rails.application.routes.draw do

    devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    end

    devise_scope :user do
      get 'sign_in', to: 'devise/sessions#new'
    end

  get '/users' => 'users#show', as: :user_root

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
