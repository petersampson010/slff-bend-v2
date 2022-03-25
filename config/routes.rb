Rails.application.routes.draw do
  resources :records
  resources :messages
  resources :user_gameweek_joiners
  resources :player_gameweek_joiners
  resources :gameweeks
  resources :players

  root 'admin_users#welcome'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :admin_users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
