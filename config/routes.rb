
Rails.application.routes.draw do

  resources :users, only: [:index, :post, :new, :logout]

  resources :students, only: :show

<<<<<<< HEAD

  resources :courses, only: [:index, :update, :show] do
=======
  resources :courses, only: [:index, :update, :show, :create] do
>>>>>>> 9af9e2c8d400b75301ac1b8dee6b3da7f79105a5
  	# found this online makes courses/:id/overview route work

    member do
      get 'overview'
    end
  end

  get '/', to: 'users#index'
  post '/login', to: 'users#login'
  post '/contact', to: 'courses#contact'
  post '/logout', to: 'users#logout'
  get '/receive_sms', to: 'courses#receive_sms'	

end