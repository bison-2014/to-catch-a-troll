Rails.application.routes.draw do

  mount Resque::Server, :at => "/resque"

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'pages#search', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :search_queries, only: [:index, :new, :create, :edit, :update, :delete]

  resources :scrapers, only: [:index, :new, :create]

  resources :pages, :only => [:index, :new, :show, :create, :update, :delete]


  resources :usermailer, only: [:index, :create]
  get 'usermailer/create'
  get 'usermailer/index'

  resources :flags


  get '/home' => 'pages#search'
  get '/search' => 'pages#search'
end
