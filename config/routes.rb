Rails.application.routes.draw do
  get 'static_pages/new'

  root 'trips#index'

  devise_for :users

  resources :trips
  resources :locations
  # get '/trips/:id/locations', to: 'locations#index', as: 'location_index'
end
