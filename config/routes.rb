
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
  resources :courses, only: [:update, :show] do
    member do
      get 'overview'
    end
  end

  get '/', to: 'users#index'
  post '/login', to: 'users#login'


end