Rails.application.routes.draw do
  resources :users
  resources :usersevents
  resources :events
  resources :hobbies
  get "api/events", to: "api/events#list_all"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
