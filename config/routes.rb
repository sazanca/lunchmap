Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
  get 'rule' => 'shops#rule'
  resources :shops do
    resources :comments, only: :create
  end  
  resources :users, only: :show do
    resources :profiles, only: [:create, :show]
  end
end