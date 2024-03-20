Rails.application.routes.draw do
 
  
  get 'trainers/index'
  get 'trainers/show'
 
   
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "(:locale)", locale: /en|hi/ do
  root'home#index'
  end
   
  devise_for :users
  resources :users
  get "users/add_membership"
  
  
  resources :memberships
  resources :gym_classes
  resources :gyms
  resources :plans
  resources :rooms do 
    resources :messages
  end

  get '/upgrade', to: 'plans#upgrade'
  


  namespace :api do
   resources :users,:gym_classes,:trainers,:memberships,:gyms,:plans
   post '/login', to: 'users#login'
   get  '/cuplan',to: 'users#plan'
   get '/gymclass', to: 'gyms#gymclass'
   patch '/upgrade', to: 'plans#upgrade'
  end
 
 
end
