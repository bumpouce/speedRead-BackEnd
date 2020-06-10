Rails.application.routes.draw do

  get '/check_user', to: 'application#check_user'
  post '/login', to: 'auth#create', as: '/'
  get '/profile', to: 'users#profile'
  post '/user_readings', to: 'user_readings#create'  
  get '/user_reading_stats/:id', to: 'user_readings#stats'
  get '/continue/:id', to: 'readings#my_readings'

  resources :auth
  resources :notes
  resources :user_readings
  resources :readings
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
