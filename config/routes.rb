SampleApp::Application.routes.draw do
  match '/about', :to  => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'

  root :to => 'pages#home'
end
