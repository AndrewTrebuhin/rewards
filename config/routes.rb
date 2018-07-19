Rails.application.routes.draw do
  root 'rewards#index'
  devise_for :users

  mount API => '/api/'
  mount GrapeSwaggerRails::Engine => '/docs'
end
