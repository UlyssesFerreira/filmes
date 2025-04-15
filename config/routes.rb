require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  get "my_movies", to: "watched_movies#index"
  get "my_favorites", to: "favorites#index"

  get "up" => "rails/health#show", as: :rails_health_check
  mount Sidekiq::Web => "/sidekiq"

  root "home#index"
  resources :movies do
    resource :watched_movie
    resource :favorite
  end
  resources :search, only: [:index]
end
