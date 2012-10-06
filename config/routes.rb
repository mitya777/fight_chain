SampleApp::Application.routes.draw do


  resources :users do
    resources :techniques 
  end
  
  resources :techniques do
    collection do
      get 'favorites'
    end
  end

  get "sessions/new"

  resources :favorite_relationships, :only => [:create, :destroy]
  resources :technique_relationships, :only => [:new, :create, :destroy]
  resources :users
  resources :techniques
  resources :videos
  resources :sessions, :only => [:new, :create, :destroy]
 
  match '/chains', :to => 'techniques#chains'
  match '/save', :to => 'techniques#save'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/about', :to  => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'
  root :to => 'pages#home'
end
