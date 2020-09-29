Rails.application.routes.draw do
  root to: "pages#home"
  # root to: "articles#index"
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
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
