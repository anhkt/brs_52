Rails.application.routes.draw do
  root "pages#show", page: "home"

  get "/pages/*page", to: "pages#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: [:index, :destroy]
  resources :books, only: [:index, :show]

  namespace :admins do
    resources :categories, except: [:new, :show]
  end
end
