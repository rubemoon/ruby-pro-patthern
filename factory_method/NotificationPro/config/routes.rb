Rails.application.routes.draw do
  resources :users, only: [ :index, :new, :edit, :create, :update ] do
    resources :notifications do
      collection do
        post :test
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  root "dashboard#index"
end
