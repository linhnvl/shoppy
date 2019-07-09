Rails.application.routes.draw do
  namespace :admin do
    namespace :api do
      resources :sessions, only: :create
      resources :forgot_passwords, only: :create
      resource :reset_passwords, only: :edit
    end
  end
  
  namespace :api do
    resources :sessions, only: :create
    resources :forgot_passwords, only: :create
    resource :reset_passwords, only: :edit
  end
end
