Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "posts#index"

  # localhost:3000/posts
  # localhost:3000/posts/new
  # localhost:3000/posts/create
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
end
