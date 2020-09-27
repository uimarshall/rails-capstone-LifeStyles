Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  get 'articles/show'
  root to: "pages#home"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
