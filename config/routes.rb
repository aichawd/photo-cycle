Rails.application.routes.draw do
  devise_for :users
  get '/:username', to: 'pictures#user_gallery'

  root to: 'pages#home'
  resources :users, only: [:index]
  resources :personal_messages, only: [:new, :create]
  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
