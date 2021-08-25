require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :weather_data
  resources :weather_stations

  resources :imports do
    get 'upload_info_view', on: :collection
    get 'dispara_job', on: :collection
  end

  root to: 'main#index'
  devise_for :users
  
end
