Rails.application.routes.draw do
  # get 'bookmarks/index'
  # get 'bookmarks/new'
  # get 'bookmarks/delete'
  # get 'lists/index'
  # get 'lists/show'
  # get 'lists/create'
  # get 'lists/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root to: "lists#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

resources :lists, only: [:index, :show, :create, :new] do
  resources :bookmarks, only: [ :new, :create ]
end
resources :bookmarks, only: [:destroy]

  # Defines the root path route ("/")
  # root "posts#index"
end
