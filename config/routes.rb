Rails.application.routes.draw do
  get 'oauths/oauth'

  get 'oauths/callback'

  get 'sessions/new'

  resources :cards do
    post 'simple_test', on: :collection
  end

  resources :users, shallow: true do
    resources :cards
  end

  get "logout" => "sessions#destroy", :as => "logout"

  resources :sessions

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  root 'home#index'
end
