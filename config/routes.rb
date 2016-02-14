
Rails.application.routes.draw do

  resources :users, only: [:index, :post, :new]

  resources :students, only: :show

  resources :courses, only: [:index, :update, :show] do
    member do
      get 'overview'
    end
  end

  get '/', to: 'users#index'
  post '/login', to: 'users#login'
  post '/contact', to: 'courses#contact'

end