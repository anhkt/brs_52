Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => "/ckeditor"

  root "pages#show", page: "home"
  get "/pages/*page" => "pages#show"

  resources :books do
    resources :reviews, only: [:new, :create]
    resources :ratings, only: [:create, :update]
  end

  resources :reviews, except: [:new, :create, :index] do
    resources :comments, only: :create
  end
  resources :users, except: :destroy do
    resources :likes, only: [:create, :destroy]
  end
  resources :comments, except: :index
  resources :relationships, only: [:create, :destroy]
  resources :user_books, only: [:create, :update]
  resources :reports, only: :create
  resources :notifications, only: [:index, :update]

  namespace :update_notification do
    resource :users, only: :update
  end

  namespace :admin do
    resources :categories do
      resources :books, only: [:new, :create]
    end
    resources :books
    resources :dashboards, only: :index
    resources :reports, only: :index
    resources :users, only: [:index, :destroy]
  end
end
