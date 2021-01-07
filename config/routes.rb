Rails.application.routes.draw do
  devise_for :users, controllers:{
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
 root "comments#index"
 resources :users 
 resources :tweets do
   resource :favorites, only: [:create, :destroy]
   resources :comments, only: [:create,:index]
 end
end
