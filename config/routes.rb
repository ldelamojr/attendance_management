
Rails.application.routes.draw do

  resources :users, only: [:index, :post, :new, :logout]

  resources :students, only: :show

<<<<<<< HEAD
  resources :courses, only: [:index, :update, :show, :create] do

=======

  resources :courses, only: [:index, :update, :show, :create] do
>>>>>>> 0669baf9ceeb008516f7b7637af7424c0b7076ce
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