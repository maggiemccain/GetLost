Rails.application.routes.draw do
  resources :users
  resources :usersevents
  resources :events
  resources :hobbies

  get "api/events", to: "api/events#list_within"

  get "api/events/reverse_geocoding", to: "api/events#get_address"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/api/usersevents', to: 'api/usersevents#create'

  namespace :api do
    resources :usersevents
  end

    # getting the login form
  get '/login', to: 'session#new'
  # creating a session / logging in
  post '/session', to: 'session#create'
  # destroying a session / logging out
  delete '/session', to: 'session#destroy'


end
