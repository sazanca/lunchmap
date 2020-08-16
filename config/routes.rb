Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
  
  resources :shops do
    # member do
    #   get 'tags/:tag', to: 'shops#index', as: :tag
    # end
    resources :comments, only: :create
  end   
  
  resources :users, only: :show
  resources :categories
end
