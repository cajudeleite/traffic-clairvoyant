Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips, only: [:index, :new, :create, :show, :update, :destroy]
  get 'trips/details/info', to: 'trips#info'
  get 'my_trips', to: 'trips#mytrips'

end
