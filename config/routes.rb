Rails.application.routes.draw do
  root 'trips#index'

  devise_for :users

  resources :trips
  resources :locations

  get '/trip/:id/find_location/:id', to: 'trips#find_location', as: 'find_location'
  patch '/trip/:id/add_location/', to: 'trips#add_location', as: 'add_location'
  patch '/trip/:id/remove_location/:trip_id', to: 'trips#remove_from_trip', as: 'remove_location'

end
