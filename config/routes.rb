Rails.application.routes.draw do
  
  root 'pages#home'
  
  devise_for :users,
              path: '',
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {registrations: 'registrations'}
              
  get 'pages/home'
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show', as: 'user'
  get 'roos/search', to: 'roos#search'
  get 'roos/search_free_word', to: 'roos#search_free_word'
  
  post '/users/edit', to: 'users#update'

  resources :roos
  resources :reservations
  
end
