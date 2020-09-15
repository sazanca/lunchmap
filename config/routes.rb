Rails.application.routes.draw do
  devise_for :users
  get 'rule' => 'shops#rule'
  root "shops#index"
  namespace :shops do
    resources :searches, only: :index
  end
  resources :shops do
    resources :comments, only: :create
  end  
 
  resources :users, only: :show do
    resources :profiles, only: [:create, :show]
  end
end