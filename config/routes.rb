Rails.application.routes.draw do
  namespace :admin do
    post "/login", to: "sessions#create"
  end
  
  post "/login", to: "sessions#create"
end
