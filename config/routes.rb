Rails.application.routes.draw do
  resources :usuarios
  devise_for :users
  resources :productos
  resources :articulos do
    resources :comentarios
end
  get 'bienvenido/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'bienvenido#index'
end
