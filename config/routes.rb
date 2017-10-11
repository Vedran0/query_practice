Rails.application.routes.draw do

  resources :query_tasks
  devise_for :users
  resource :users
  resources :people
  resources :solutions
  get "run_solution", to: "solutions#run_solution"
  root "pages#home"

end
