Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => "/ckeditor"

  root "pages#show", page: "home"
  get "/pages/*page" => "pages#show"
end
