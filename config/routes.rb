Rails.application.routes.draw do
  root "pages#show", page: "home"

  get "/pages/*page", to: "pages#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: [:index, :destroy]

  namespace :admins do
    resources :categories, only: [:index, :create]
  end
end
