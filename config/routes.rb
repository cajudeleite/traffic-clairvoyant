Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :viagems
  post 'maps_api', to: 'viagems#maps_api', as: :api
end
