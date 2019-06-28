Rails.application.routes.draw do
  root 'static_pages#home'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/videos',  to: 'static_pages#videos'
  get  '/statistics', to: 'static_pages#statistics'
  get  '/progress',   to: 'static_pages#progress'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end