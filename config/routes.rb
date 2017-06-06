require 'sidekiq/web'

Rails.application.routes.draw do
  resources :tasks

  mount Sidekiq::Web => '/sidekiq'
end
