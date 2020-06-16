Rails.application.routes.draw do
  resources :shops
  resources :categories
  get 'welcome/index'
  root 'welcome#index'
  
  # get 'maps/inadex'
  # root 'maps#index'
  # resouces :maps, only:[:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
