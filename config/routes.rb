Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'photos/create'

  devise_for :users
  root 'places#index'
  resources :places do
    resources :comments, :photos, only: :create
  end
  resources :users, only: :show
end
