Rails.application.routes.draw do

  get 'usermailer/create'

  get 'usermailer/index'

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

  get '/home' => 'pages#search'
  get '/search' => 'pages#search'
end
