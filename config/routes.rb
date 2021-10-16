Rails.application.routes.draw do
  root to: "home#index"

  resources :tasks, only: [:create, :update]
  resources :in_backlog_tasks, only: [:create, :update, :destroy]
end
