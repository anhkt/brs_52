Rails.application.routes.draw do
  root "pages#show", page: "home"

  get "/pages/*page", to: "pages#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: [:destroy]
  resources :books, only: [:index, :show]
  resources :reviews, except: [:index, :show]
  resources :relationships, only: [:index, :create, :destroy]
  resources :favorite_books, only: [:create, :destroy]

  namespace :admins do
    resources :categories, except: [:new, :show]
    resources :books
  end
end
