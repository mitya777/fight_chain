SampleApp::Application.routes.draw do

  get '/update_skills', :to => 'techniques#update_skills', :as => 'update_skills'

  resources :users do
    resources :techniques 
  end
  
  resources :techniques do
    collection do
      get 'favorites'
    end
    collection do
      get 'library'
    end
  end

  get "sessions/new"

  resources :favorite_relationships, :only => [:create, :destroy]
  resources :technique_relationships, :only => [:new, :create, :destroy]
  resources :users
  resources :techniques
  resources :videos
  resources :sessions, :only => [:new, :create, :destroy]
 
  match '/share', :to => 'techniques#share', :as => 'share_technique'
  match '/chains', :to => 'techniques#chains'
  match '/save', :to => 'techniques#save'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'


  match '/about', :to  => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'
  root :to => 'techniques#index'
end
