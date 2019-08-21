Rails.application.routes.draw do
  get 'static_pages/splash'
  get 'static_pages/profile'

  get 'photos/create'


  # post 'test', to: 'places#test'

  get 'latest', to: 'places#latest'

  post 'tally', to: 'places#tally'
  get 'get/tally',  to: 'places#get_tally'

  resources :tallies



<<<<<<< HEAD
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
=======
  devise_for :users
>>>>>>> bbdd858212d0337f0d5c5fa08e5c0da9c6cd9b82

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'

  end

  root 'places#index'
  resources :places do
    resources :comments, :photos, only: :create
    # get '/tally', to: "places#all_tally"
  end
  resources :users do
    patch :avatars, only: :create
  end

  mount ActionCable.server, at: '/cable'
end
