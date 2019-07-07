Rails.application.routes.draw do
  get 'static_pages/splash'

  post '/rate' => 'rater#create', :as => 'rate'
  get 'photos/create'

  post 'test', to: 'places#test'

  get 'latest', to: 'places#latest'

  post 'tally', to: 'places#tally'
  get 'get/tally',  to: 'places#get_tally'

  resources :tallies

  devise_for :users
  root 'places#index'
  resources :places do
    resources :comments, :photos, only: :create
    # get '/tally', to: "places#all_tally"
  end
  resources :users, only: :show

  mount ActionCable.server, at: '/cable'
end
