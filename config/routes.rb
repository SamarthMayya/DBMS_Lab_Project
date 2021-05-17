Rails.application.routes.draw do

  resources :transactions, only: [:index, :show, :new, :create] 
  resources :requests do
    member do
      post 'approve'
    end
  end
  resources :accounts
  resources :users do 
    collection do 
      get 'validate-aadhar' 
    end 
  end 
  root 'homepage#home'
  # root 'homepage#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'create', to: 'transactions#create', as: 'create_transaction'
  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'users/new'
  get 'users/create'
  get 'user/edit'
  get 'request/completed', to: 'requests#completed'
  get 'request/pending', to: 'requests#pending'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users


end
