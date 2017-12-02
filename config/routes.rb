Rails.application.routes.draw do
  root 'trips#index'

  devise_for :users

  resources :trips
  resources :locations
  # get '/trips/:id/locations', to: 'locations#index', as: 'location_index'
end
