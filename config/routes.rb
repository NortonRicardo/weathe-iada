Rails.application.routes.draw do

  resources :weather_data
  resources :weather_stations

  resources :imports do
    get 'upload_info_view', on: :collection
  end

  root to: 'main#index'
  devise_for :users
  
end
