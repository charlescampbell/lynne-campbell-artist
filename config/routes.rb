# frozen_string_literal: true

Rails.application.routes.draw do
  root 'paintings#index'

  resources :paintings
end
