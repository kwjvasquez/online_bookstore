Rails.application.routes.draw do
  root "welcome#index"

  resources :authors, only: %i[ index show ]
  resources :books, only: %i[ index show ]
  resources :tags, only: %i[ index show ]
  resources :request_books, only: %i[ index ]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new", as: :new_user_session
    post "sign_in", to: "devise/session#create", as: :user_session
    delete "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end
end
