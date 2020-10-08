Rails.application.routes.draw do
  
  get 'sessions/new'
  root to: "pages#home"
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  # root to: "articles#index"
  
  resources :categories
  # resources :users do
  #   resources :articles
    
  # end
  # get 'articles/index'
  # get 'articles/new'
  # get 'articles/show'
  
  resources :articles
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
