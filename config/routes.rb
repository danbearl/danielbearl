Danielbearl::Application.routes.draw do
  get 'log_in' => 'user_sessions#new', as: 'log_in'
  get 'log_out' => 'user_sessions#destroy', as: 'log_out'
  get 'blog' => 'posts#index', as: 'blog'
  get 'home' => 'pages#index', as: 'home'

  root to: 'pages#index'

  resources :pages
  resources :posts
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :update_slug
  post "/:slug", to: "pages#destroy", as: :destroy_slug
end
