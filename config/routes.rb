Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips, only: [:index, :new, :create]
  resources :viagems
  get 'trips/info', to: 'trips#info'
  get 'my_trips', to: 'trips#mytrips'
  post 'maps_api', to: 'viagems#maps_api', as: :api

end
