Rails.application.routes.draw do
  get '/'  => 'homes#top', as: 'root'
  resources :books
end
