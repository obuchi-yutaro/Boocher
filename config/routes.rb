Rails.application.routes.draw do
  devise_for :users
  resources :books do
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show]
  root 'books#index'
end
  	
