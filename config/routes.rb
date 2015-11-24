Rails.application.routes.draw do
  namespace :api do
    resources :books
    resources :finished_books, only: [:index]
    resources :genres, only: :index
  end
end
