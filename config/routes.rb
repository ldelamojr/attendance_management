Rails.application.routes.draw do

  resources :users, only: :index

  resources :producers, only: :show do
    resources :instructors, only: :show
    resources :students, only: :show
  end

  resources :instructors, only: :show do
    resources :students, only: :show
  end

  resources :students, only: :show
  resources :courses, only: [:update, :show]

  get '/', to: 'users#index'
  post '/login', to: 'users#welcome'
end
