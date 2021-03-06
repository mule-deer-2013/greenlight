Greenlight::Application.routes.draw do
  resources :sessions
  resources :votes
  # resources :users, only: [:index, :new, :create, :show, :edit, :update]
  resources :users do
     get "new_message", :on => :collection
     get "show_message", :on => :collection
     post "create_message", :on => :collection
  end

  resources :messages
  
  match 'users/:id', to: 'users#update', :via => [:post]
  match 'sessions/:id', to: 'sessions#destroy', :via => [:post]
  root to: 'users#index'
  
  
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

end
