SampleApp::Application.routes.draw do
  resources :users

  
  match '/signup', :to => 'users#new'

  match '/about', :to  => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'
  root :to => 'pages#home'
end
