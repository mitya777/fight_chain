SampleApp::Application.routes.draw do


  resources :users do
    resources :techniques 
  end

  get "sessions/new"

  resources :technique_relationships
  resources :users
  resources :techniques
  resources :videos
  resources :sessions, :only => [:new, :create, :destroy]
 
  match '/save', :to => 'techniques#save'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/about', :to  => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'
  root :to => 'pages#home'
end
