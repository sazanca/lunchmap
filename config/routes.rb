Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
  get 'rule' => 'shops#rule'
  resources :shops do
  # namespace :shops do
  #   resources :rules, only: :index
  # end
    # member do
    #   get 'tags/:tag', to: 'shops#index', as: :tag
    # end
  
    resources :comments, only: :create
    # collection do
    #   get 'rule'
    # end
  end

  resources :users, only: :show
  resources :categories
end
