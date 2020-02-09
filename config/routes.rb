Rails.application.routes.draw do
  root to: "pages#index"
  resources :movies 
  resources :comments
  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#ndestroy"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  namespace :admin do
    get "/", to: "admin#index"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
