Rails.application.routes.draw do
  root to: "home#index"

  resources :tasks, only: [:create, :update]
end
