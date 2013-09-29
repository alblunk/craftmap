Beeline::Application.routes.draw do

  devise_for :users

  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'faq' => 'pages#faq'
  get 'terms' => 'pages#terms'
  get 'privacy' => 'pages#privacy'

  get 'contact' => 'contact#new'
  post 'contact' => 'contact#create'

  resources :brands do
    resources :products
  end

  resources :products, only: [ :index, :show ]

  namespace :admin do
    resources :users, only: [ :index, :update ]
  end

  namespace :api do
    resources :registrations, only: [ :create ]
  end

  root :to => 'pages#home'

end
