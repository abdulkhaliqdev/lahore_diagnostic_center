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
    resources :referrers
    resources :patients do
      member do
        get 'invoice'
      end

      collection do
        get 'search'
      end
    end
    resources :procedures
    resources :users

    root 'admin#dashboard'
  end
  
  namespace :receptionist do
    resources :dashboard, only: [:index]
    resources :patients do      
      collection do
        get 'search'
      end
    end

    root 'receptionist#dashboard'
  end

  get '/report', to: 'home#report'
  get '/invoice', to: 'home#invoice'
  get '/view_report', to: 'home#view_report'

  root 'home#index'
end
