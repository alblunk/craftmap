Beeline::Application.routes.draw do

  devise_for :users

  get 'home' => 'pages#home'
  get 'landing' => 'pages#landing'
  get 'about' => 'pages#about'
  get 'terms' => 'pages#terms'
  get 'privacy' => 'pages#privacy'
  get 'jobs' => 'pages#jobs'
  get 'upload' => 'pages#upload'
  get 'all_brands' => 'pages#all_brands'

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
