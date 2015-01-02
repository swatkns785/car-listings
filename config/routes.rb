Rails.application.routes.draw do
  root "manufacturers#index"

  resources :manufacturers, only: [:index, :new, :create]
end
