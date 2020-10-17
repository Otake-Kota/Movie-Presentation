Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'

  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :movies, only: [:new, :create, :show, :destroy] do
    post   :comment_create
    delete :comment_destroy
  end
  resources :likes, only: [:create, :index, :destroy]
  resources :themoviedb_api, only: [:index]
end
