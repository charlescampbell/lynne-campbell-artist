# frozen_string_literal: true

Rails.application.routes.draw do
  root 'paintings#index'

  get 'upload', to: 'paintings#new', as: :upload
  get 'contact', to: 'paintings#contact', as: :contact
  get 'sell/:id', to: 'paintings#mark_sold', as: :sell
  get 'show/:id', to: 'paintings#show', as: :show_painting
  post 'description/new', to: 'paintings#add_description', as: :create_description

  resources :descriptions
  resources :paintings
end