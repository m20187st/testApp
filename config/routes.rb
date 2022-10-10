Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "posts#index"

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :posts do
	resources :favorites, only: [:create, :destroy]
  end
end
