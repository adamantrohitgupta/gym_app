Rails.application.routes.draw do
 
   
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root'home#index'
  devise_for :users
  get 'users/index'
  get 'users/show'
  delete 'users/id'
  get "users/add_membership"
  
  
  resources :memberships
  resources :gym_classes
  resources :gyms
  resources :plans
  patch '/upgrade', to: 'plans#upgrade'
   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
