
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

  post '/texty', to: 'texty#index'


  post '/contact', to: 'courses#contact'
  post '/recieve', to: 'courses#recieve'
  post '/logout', to: 'users#logout'	


end