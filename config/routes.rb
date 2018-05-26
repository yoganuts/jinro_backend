# frozen_string_literal: true

Rails.application.routes.draw do
  resources :villages do
    resources :villagers, shallow: true
    resources :talks, ahallow: true
  end
  resources :roles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
