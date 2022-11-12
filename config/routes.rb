# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  
  # Add comment to a post
  post 'users/:user_id/posts/:id/', to: 'posts#comment_post', as: 'comment_post'

  # Like a post
  post '/users/:user_id/posts/:id/like', to: 'posts#like_post', as: 'likes'
end

