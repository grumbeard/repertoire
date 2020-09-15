Rails.application.routes.draw do
  get 'tags/new'
  get 'tags/create'
  # Send users to sign-up page by default
  devise_for :users
  root to: 'launch#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :stories do
    resources :taggings, only: [:create, :index, :destroy]
    member do
      get :experience
      get :pricing
    end
  end
end
