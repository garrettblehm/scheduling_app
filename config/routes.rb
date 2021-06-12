# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'

    namespace :madmin do
      namespace :active_storage do
        resources :variant_records
      end
      namespace :active_storage do
        resources :attachments
      end
      resources :announcements
      resources :notifications
      namespace :active_storage do
        resources :blobs
      end
      resources :services
      resources :users
      resources :businesses
      root to: 'dashboard#show'
    end
  end

  resources :businesses, only: [:index] do
    resources :slots
  end

  authenticate :user, ->(u) { u.owner? } do
    resources :businesses
  end

  resources :notifications, only: %i[index show]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
