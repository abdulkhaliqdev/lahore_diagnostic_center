Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  namespace :admin do
    resources :dashboard, only: [:index]
  end
  
  namespace :receptionist do
    resources :dashboard, only: [:index]
  end

  root 'home#index'
end
