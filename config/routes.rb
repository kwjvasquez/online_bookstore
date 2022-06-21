Rails.application.routes.draw do
  root "welcome#index"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :authors, only: %i[ index show ]
  resources :books, only: %i[ index show ]
  resources :tags, only: %i[ index show ]
  resources :request_books, only: %i[ index ]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
end
