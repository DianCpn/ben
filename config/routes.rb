Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :searches, only: [:new, :create, :update, :edit]
  resources :products, only: [:show, :create]
  resources :containers, only: [:index, :create, :new]

  get "/favorites", to: "searches#favorites"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
