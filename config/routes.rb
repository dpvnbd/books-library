Rails.application.routes.draw do
  resources :readers
  resources :categories do
    get :report, on: :collection
  end
  resources :books
  resources :readers_books

  devise_for :admins
  root to: 'books#index'
end
