Rails.application.routes.draw do
  devise_for :users
  get 'pages/about'
  get 'pages/faq'
  get 'pages/employee'
  get 'pages/employer'

  root 'pages#index'

  resources :pages
  resources :jobs
  
  # TODO searching why this works with app/controllers/application_controller.rb
  # TODO Search why if you delete after_sign_in_path_for from app/controllers/application_controller.rb
  # this dosen't work at least you change ":user" to ":users"
  
  namespace :users do
    root :to => 'pages#home'
  end
end
