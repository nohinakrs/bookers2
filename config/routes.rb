Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books, only:[:index, :edit, :show, :create, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
  
  get "homes/about" => "homes#about", as: "about"
end