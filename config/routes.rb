Rails.application.routes.draw do

  resources :users, only: [:index, :post, :new]

  resources :producers, only: :show do
    resources :instructors, only: :show
    resources :students, only: :show
  end

  resources :instructors, only: :show do
    resources :students, only: :show
  end

  resources :students, only: :show
  resources :courses, only: [:update, :show]

  get '/', to: 'users#new'
  post '/post', to: 'students#show'

end
