Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books, only:[:index, :edit, :show]
  resources :users, only:[:show, :edit, :index]
  
  get "homes/about" => "homes#about", as: "about"
end