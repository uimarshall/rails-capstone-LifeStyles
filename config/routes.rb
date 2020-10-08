Rails.application.routes.draw do
  
  root to: "pages#home"
   resources :categories
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :articles do
    resources :comments, only: [:create]
    resources :votes, only: [:create, :destroy]
  end
  # root to: "articles#index"
  
  # resources :categories
  # resources :users do
  #   resources :articles
    
  # end
  # get 'articles/index'
  # get 'articles/new'
  # get 'articles/show'
  
  # resources :articles
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
