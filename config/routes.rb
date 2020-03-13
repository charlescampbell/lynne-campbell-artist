# frozen_string_literal: true

Rails.application.routes.draw do
  root 'paintings#index'

  get 'upload', to: 'paintings#new', as: :upload

  resources :paintings
end
