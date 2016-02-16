
Rails.application.routes.draw do

  resources :users, only: [:index, :post, :new, :logout]

  resources :students, only: :show

  resources :courses, only: [:index, :update, :show] do
  	# found this online makes courses/:id/overview route work
    member do
      get 'overview'
    end
  end

  get '/', to: 'users#index'
  post '/login', to: 'users#login'
  post '/contact', to: 'courses#contact'
  post '/logout', to: 'users#logout'
  # get '/receive_sms', to: 'courses#receive_sms'	
  post '/sms', to: 'courses#sms'

  # get '/sms', to: 'courses#sms'

end