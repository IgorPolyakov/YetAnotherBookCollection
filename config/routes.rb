Rails.application.routes.draw do
  get 'news/last'
  get 'news/search'
  resources :books do
    resources :reviews
  end
  root 'books#index'
end
