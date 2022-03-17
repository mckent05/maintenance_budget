# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  

  # Defines the root path route ("/")
  # root "articles#index"

  unauthenticated do
    root "users#index"
  end

  
  devise_scope :user do
    root 'equipments#index', as: 'allequipments'

     resources :users, only: %i[index]
    resources :equipments, only: %i[index create destroy new show]
    resources :repairs, only: %i[create destroy new]
  end
  
end
