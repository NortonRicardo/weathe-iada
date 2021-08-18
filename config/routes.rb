Rails.application.routes.draw do

  resources :weather_data
  resources :weather_stations
  resources :imports
  root to: 'main#index'
  devise_for :users
  
end
