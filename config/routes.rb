# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'equipments#index'

  resources :users, only: %i[index]
  resources :equipments, only: %i[index create destroy new show]
  resources :repairs, only: %i[create destroy new]
end
