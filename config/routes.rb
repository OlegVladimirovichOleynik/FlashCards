Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    namespace :dashboard do
      resources :cards do
        post 'simple_test', on: :collection
      end

      resources :users, :decks, shallow: true do
        resources :cards
      end

      resources :users do
        member do
          put 'current_deck'
        end
      end
    end

    namespace :home do
      get "logout" => "sessions#destroy", :as => "logout"
      resources :sessions
      post "oauth/callback" => "oauths#callback"
      get "oauth/callback" => "oauths#callback"
      get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
    end

    root 'dashboard/home#index'
  end
end
