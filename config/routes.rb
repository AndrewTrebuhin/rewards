Rails.application.routes.draw do
  root 'rewards#index'
  devise_for :users
end
