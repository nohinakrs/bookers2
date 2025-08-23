Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books, only:[:index, :show, :create, :edit, :update, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
  
  get "homes/about" => "homes#about", as: "about"
end