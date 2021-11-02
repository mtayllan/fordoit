Rails.application.routes.draw do
  root to: "home#index"

  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/logout" => "auth0#logout"

  get "login", to: "login#index"

  resources :tasks, only: [:create, :update]
  resources :in_backlog_tasks, only: [:create, :update, :destroy]
  resources :events, only: [:create, :update, :destroy]
  resources :repeats, only: [:create, :update, :destroy]
end
