Rails.application.routes.draw do

  resources :transactions, only: [:index, :show, :new, :create]   
  resources :requests
  resources :accounts
  resources :users
  root 'homepage#home'
  # root 'homepage#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'users/new'
  get 'users/create'
  get 'user/edit'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users


end
