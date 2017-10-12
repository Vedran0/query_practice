Rails.application.routes.draw do

  devise_for :users
  resources :query_tasks
  resources :users
  resources :people
  resources :solutions
  resources :comments
  get "run_solution", to: "solutions#run_solution"
  root "pages#home"

end
