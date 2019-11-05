# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :hunters do
    resources :hunters_improvements
  end
  resources :improvements
  resources :moves
  resources :ratings
  resources :playbooks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
