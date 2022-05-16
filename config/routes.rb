Rails.application.routes.draw do
  root "welcome#index"

  resources :authors, only: %i[ index show ]
end
