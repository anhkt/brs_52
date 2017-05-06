Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => "/ckeditor"

  root "pages#show", page: "home"
  get "/pages/*page" => "pages#show"

  resources :reviews, except: :index do
    resources :comments, only: :create
  end
  resources :users, except: :destroy
  resources :comments, except: :index
end
