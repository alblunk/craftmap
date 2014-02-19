Beeline::Application.routes.draw do

  devise_for :users

  get 'home' => 'pages#home'
  get 'home_old' => 'pages#home_old'
  get 'landing' => 'pages#landing'
  get 'about' => 'pages#about'
  get 'terms' => 'pages#terms'
  get 'privacy' => 'pages#privacy'
  get 'team' => 'pages#team'
  get 'map' => 'pages#map'
  get 'upload' => 'pages#upload'
  get 'all_brands' => 'pages#all_brands'
  get 'all_products' => 'pages#all_products'

  get 'contact' => 'contact#new'
  post 'contact' => 'contact#create'

  resources :brands do
    resources :products
  end

  resources :products, only: [ :index, :show, :destroy, :edit ] do
    resources :secondary_images
  end

  namespace :admin do
    resources :users, only: [ :index, :update, :destroy ]
  end

  namespace :api do
    resources :registrations, only: [ :create ]
  end

  root :to => 'pages#home'

end
