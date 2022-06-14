Rails.application.routes.draw do
  
  root 'pages#home'
  
  devise_for :users,
              path: '',
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {registrations: 'registrations'}
              
  get 'pages/home'
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show', as: 'user'
  
  post '/users/edit', to: 'users#update'

  
  
  resources :rooms, except: [:edit] do
    member do
      get 'search'
      get 'word_search'
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'location'
      get 'preload'
      get 'preview'
      delete :delete_photo
      post :upload_photo
    end
    resources :reservations
  end
  
end
