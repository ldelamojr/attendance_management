Rails.application.routes.draw do
  resources :courses
  resources :attendances
  resources :users
  resources :students
  resources :producers
  resources :instructors

  get '/login', to: 'users#index'
end
