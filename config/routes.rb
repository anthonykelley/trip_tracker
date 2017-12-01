Rails.application.routes.draw do
  devise_for :users

  root 'trips#index'
  resources :trips
end
