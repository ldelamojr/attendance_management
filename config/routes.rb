
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
<<<<<<< HEAD
  post '/texty', to: 'texty#index'

=======
  post '/contact', to: 'courses#contact'
>>>>>>> b9abf49749561eb4fcb1c8a53e1474f343378615

end