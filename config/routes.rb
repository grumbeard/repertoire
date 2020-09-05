Rails.application.routes.draw do
  # Send users to sign-up page by default
  devise_for :users
  root to: 'launch#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :stories do
    resources :tagging, only: [ :create, :index ]
  end
end
