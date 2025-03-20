require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  get "my_movies", to: "watched_movies#index"

  get "up" => "rails/health#show", as: :rails_health_check
  mount Sidekiq::Web => "/sidekiq"

  root "home#index"
  resources :movies do
    resource :watched_movie
    resource :favorite
  end
end
