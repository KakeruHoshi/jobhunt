Rails.application.routes.draw do
  resources :events
  devise_for :users

  resources :users, :only => [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'hello#index'
  resources :blogs
  resources :hello
  resources :top
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  resources :events
  get "advises" => "advises#show"
end
