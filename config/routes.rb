Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :users, only: [:index]
  resources :chatrooms, only: [:create, :show] do
    resources :messages, only: :create
  end

  resources :messages, only: :create
  resources :pictures, only: [:new, :create, :destroy]
  resources :collaborations
  get '/:username', to: 'pictures#user_gallery', as: "gallery"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
