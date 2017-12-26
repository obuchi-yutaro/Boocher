Rails.application.routes.draw do
  devise_for :users
  resources :books do

    collection do
      get 'search'
      get "result"
    end
  end

  resources :users, only: :show do
    # binding.pry
    resources :reviews, only: [:new, :create, :show, :index]
  end


  root 'books#index'
end
  	
