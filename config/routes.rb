# frozen_string_literal: true

Rails.application.routes.draw do
  resources :talks
  resources :villages do
    resources :villagers, shallow: true
  end
  resources :roles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
