Rails.application.routes.draw do
  get 'news/last'

  get 'news/search'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources :reviews
  end
  root 'books#index'
end
