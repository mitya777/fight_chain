SampleApp::Application.routes.draw do
  get "quests/new"

  get "quests/create"

  get "quests/destroy"

  get "contents/create"

  get "contents/destroy"

  resources :users do
    member do
      get :following, :followers
    end
  end

  get "sessions/new"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  resources :quests
  resources :questions
  resources :contents
  
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/about', :to  => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'
  root :to => 'pages#home'
end
