Rails.application.routes.draw do

  get 'home/about'
  root :to => 'home#top'

  devise_for :users
  root 'users#show'

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  
  resources :users, only: [:show, :edit, :update, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 


end


