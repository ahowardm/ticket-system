Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  resources :projects
  resources :ticket_statuses
  resources :tickets
  post 'tickets/:id/update_status', to: 'tickets#update_status', as: :ticket_update_status
end
