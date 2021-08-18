Rails.application.routes.draw do

  resources :imports
  root to: 'main#index'
  devise_for :users
  
end
