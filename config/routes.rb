Rails.application.routes.draw do
  namespace :admin do
    resources :sessions, only: :create
  end
  
  resources :sessions, only: :create
end
