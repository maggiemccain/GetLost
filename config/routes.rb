Rails.application.routes.draw do
  resources :users
  resources :usersevents
  resources :events
  resources :hobbies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # getting the login form
  get '/login', to: 'session#new'
  # creating a session / logging in
  post '/session', to: 'session#create'
  # destroying a session / logging out
  delete '/session', to: 'session#destroy'
end
