Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :searches, only: [:new, :create, :edit, :update]
  resources :products, only: :show

  get "/favorites", to: "searches#favorites"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
