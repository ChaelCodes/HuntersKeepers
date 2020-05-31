# frozen_string_literal: true

Rails.application.routes.draw do
  root 'hunters#index'
  resources :gears
  devise_for :users
  resources :hunters do
    resources :hunters_improvements
  end
  resources :improvements
  resources :moves do
    member do
      get 'roll'
    end
  end
  resources :ratings
  resources :playbooks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
