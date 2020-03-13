# frozen_string_literal: true

Rails.application.routes.draw do
  root 'paintings#index'

  get 'upload', to: 'paintings#new', as: :upload
  get 'contact', to: 'paintings#contact', as: :contact
  get 'sell/:id', to: 'paintings#mark_sold', as: :sell

  resources :paintings
end
