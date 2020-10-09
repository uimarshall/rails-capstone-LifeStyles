Rails.application.routes.draw do
  
  # root to: "pages#home"
  root to: "articles#index"
  resources :categories
  resources :users
  # resources :users, only: [:new, :create]
   resources :sessions, only: [:new, :create, :destroy]
  # resources :sessions, only: [:new, :create] do
  #   delete :destroy, on: :collection
  # end

  resources :articles do
   
    resources :votes, only: [:create, :destroy]
  end
  
  
end
