Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "welcome#index"
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do 
    namespace :v1 do 
      get "/users/search", to: "users_search#index"
      get "/users/:id/index", to: "users#index"
      get "/users/:id", to: "users#show"

      get "users/:id/my_games", to: "users_games_search#index"

      post "users/:id/add_friend", to: "friends#create"
      delete "users/:id/remove_friend", to: "friends#destroy"
      get "users/:id/friends", to: "friends#index"

      post "users/:id/start_game", to: "games#create"

      post "/sessions", to: "sessions#create"
      delete "/sessions", to: "sessions#destroy"
    end
  end
end
