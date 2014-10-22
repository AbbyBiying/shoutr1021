require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]

  resource :shouts, only: [:new, :create]

  resources :text_shouts, only: [:create] 

resources :picture_shouts, only: [:create]
  resources :users, only: [:new, :create, :show] do 
    member do
      post "follow" => "follows#create"
      delete "follow" => "follows#destroy"
    end
  end 

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end
  constraints Monban::Constraints::SignedOut.new do 
    root "sessions#new"
  end
end
