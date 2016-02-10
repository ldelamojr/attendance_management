Rails.application.routes.draw do
  resources :courses
  resources :attendances
  resources :users

  get '/login', to: 'users#index'
end
