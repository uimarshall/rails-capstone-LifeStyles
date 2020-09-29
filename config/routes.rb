Rails.application.routes.draw do
  resources :categories
  # get 'articles/index'
  # get 'articles/new'
  # get 'articles/show'
  resources :users do
    resources :articles
    
  end
 
  root to: "pages#home"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
