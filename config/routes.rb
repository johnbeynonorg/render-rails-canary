require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  get '/health', to: 'health#index'
  
  mount Sidekiq::Web => "/sidekiq"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
