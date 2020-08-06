Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
  resources :shops do
    resources :comments, only: :create
    resources :tag
  end
  
  resources :users, only: :show
  resources :categories
end
