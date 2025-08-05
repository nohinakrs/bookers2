Rails.application.routes.draw do
resouces :books, only:[:index, :edit, :show, :destroy]
resouces :Users, only:[:show, :edit]
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
end