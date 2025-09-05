Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :books, only:[:edit, :create, :index, :show, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
  
  get "/" => "homes#about", as: "about"
end
