Rails.application.routes.draw do
  devise_for :users

  root to: 'pictures#user_feed'
  #root to: 'pages#home'

  resources :users, only: [:index]

  resources :chatrooms, only: [:create, :show, :index] do
    resources :messages, only: :create
  end

  resources :pictures, only: [:new, :create, :destroy]
  resources :collaborations
  get '/feed', to: 'pictures#user_feed', as: "feed"
  get '/:username', to: 'pictures#user_gallery', as: "gallery"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
