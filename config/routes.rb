Rails.application.routes.draw do
  resources :readers
  resources :categories
  resources :books
  resources :readers_books

  devise_for :admins
  root to: 'books#index'
end
