Rails.application.routes.draw do
  root "posts#index"

  #  devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }

  get 'posts/new', to: 'posts#new', as: :new_post
  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'posts#show', as: :post
  get 'posts/:id/edit', to: 'posts#edit', as: :edit_post
  patch 'posts/:id', to: 'posts#update'
  delete 'posts/:id', to: 'posts#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
