Rails.application.routes.draw do
  devise_for :users
  get 'rule' => 'shops#rule'
  root "shops#index"
  # get 'profile' => 'users#profiles'
  # post   '/like/:shop_id' => 'likes#like',   as: 'like'
  # delete '/like/:shop_id' => 'likes#unlike', as: 'unlike'
  namespace :shops do
    resources :searches, only: :index
  end
  resources :shops do
    resources :comments, only: :create
    member do
      post   '/like/:shop_id' => 'likes#like',   as: 'like'
      delete '/like/:shop_id' => 'likes#unlike', as: 'unlike'
    end
  end
  
  resources :users, only: :show do
    resource :profile, only: [:create, :show, :edit, :update]
    # get 'profile', to: 'users#show'
    collection do
      get :likes
    end
  end

end
