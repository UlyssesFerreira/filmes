require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  mount Sidekiq::Web => "/sidekiq"

  root "home#index"
  resources :movies do
  resource :watched_movie
  end
end
