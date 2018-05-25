# frozen_string_literal: true

Rails.application.routes.draw do
  resources :villagers
  resources :roles
  resources :villages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
