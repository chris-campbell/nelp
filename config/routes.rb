Rails.application.routes.draw do
  get 'static_pages/splash'
  get 'static_pages/profile'

  get 'photos/create'


  # post 'test', to: 'places#test'

  get 'latest', to: 'places#latest'

  post 'tally', to: 'places#tally'
  get 'get/tally',  to: 'places#get_tally'

  resources :tallies



  devise_for :users

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
