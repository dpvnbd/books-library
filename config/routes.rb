Rails.application.routes.draw do
  resources :readers
  resources :categories
  resources :books

  devise_for :admins
  root to: 'books#index'
end
