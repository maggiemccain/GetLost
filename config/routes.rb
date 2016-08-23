Rails.application.routes.draw do
  resources :users
  resources :usersevents
  resources :events
  resources :hobbies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/api/usersevents', to: 'api/usersevents#create'

  namespace :api do
    resources :usersevents
  end
end
