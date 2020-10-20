Rails.application.routes.draw do
  
  # root to: "pages#home"
  root to: "articles#index"
  resources :categories
  resources :users
  
  resources :sessions, only: [:index, :create]
  
get 'logout', to: 'sessions#destroy'
  resources :articles do
   
    resources :votes, only: [:create, :destroy]
  end
 
  
end
