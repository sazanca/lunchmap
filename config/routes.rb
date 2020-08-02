Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
  resources :shops do
    resources :comments, only: :create   
  end
  resources :users, only: :show
  resources :categories
end
