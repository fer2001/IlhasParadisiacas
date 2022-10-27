Rails.application.routes.draw do
  devise_for :users
  root to: "islands#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :islands do
    resources :orders, only: %i[new create]
  end
  resources :orders, only: :destroy
  namespace :profile do
    resources :islands, only: :index
  end
end
