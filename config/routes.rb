Rails.application.routes.draw do

  devise_for :users
  resources :query_tasks
  resources :users
  resources :password_changes, only: [:new, :create]
  resources :people
  resources :solutions
  resources :comments
  get "run_solution", to: "solutions#run_solution"
  root "pages#home"
  get "resource", to: "pages#resource"

end
