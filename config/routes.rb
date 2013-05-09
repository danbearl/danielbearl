Danielbearl::Application.routes.draw do
  get 'log_in' => 'user_sessions#new', as: 'log_in'

  root to: 'pages#index'
  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]

  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :slug
  post "/:slug", to: "pages#destroy", as: :slug
end
