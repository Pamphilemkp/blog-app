# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end


  # Defines the root path route ("/")
   root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end

  
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  
  # # Add comment to a post
   post 'users/:user_id/posts/:id/', to: 'comments#create', as: 'comment_post'

  # # Like a post
   post '/users/:user_id/posts/:id/like', to: 'likes#create', as: 'likes'
end

