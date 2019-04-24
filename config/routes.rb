Rails.application.routes.draw do
  root "homepage#index"
  resources :works
end
