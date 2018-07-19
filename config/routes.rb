Rails.application.routes.draw do
  root 'rewards#index'
  get :rewards, to: 'rewards#index'

  devise_for :users

  mount API => '/api/'
end
