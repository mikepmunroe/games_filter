GamesFilter::Application.routes.draw do
  root :to => 'wicked', :action => :index

  resources :athletes

  match 'wicked' => 'wicked#index'
  match 'southie' => 'southie#index'
  end
