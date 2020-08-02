Rails.application.routes.draw do
  # Send users to sign-up page by default
  devise_for :users, controllers: { registrations: 'registrations' }
  as :user do
    get '/' => 'devise/registrations#new'
  end
  root to: 'launch#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :stories
end
