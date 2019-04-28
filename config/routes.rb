Rails.application.routes.draw do
  root "homepage#index"

  resources :works
  resources :users
  resources :votes

  post '/works/:work_id/votes', to: 'votes#create', as: 'create_vote'
end
