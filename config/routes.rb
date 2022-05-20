Rails.application.routes.draw do
  root "welcome#index"

  resources :authors, only: %i[ index show ]
  resources :books, only: %i[ index show ]
end
