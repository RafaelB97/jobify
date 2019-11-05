Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  get 'pages/about'
  get 'pages/faq'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # TODO searching why this works with app/controllers/application_controller.rb
  # TODO Search why if you delete after_sign_in_path_for from app/controllers/application_controller.rb
  # this dosen't work at least you change ":user" to ":users"
  
  namespace :users do
    root :to => 'pages#home'
  end
end
