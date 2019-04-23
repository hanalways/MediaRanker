Rails.application.routes.draw do
  root "works#index"
  resources :work, only: [:index]
end
