Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    resources :cards do
      post 'simple_test', on: :collection
    end

    resources :users do
      member do
        put 'current_deck'
      end
    end

    resources :users, :decks, shallow: true do
      resources :cards
    end

    get "logout" => "sessions#destroy", :as => "logout"

    resources :sessions

    post "oauth/callback" => "oauths#callback"
    get "oauth/callback" => "oauths#callback"
    get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

    root 'home#index'
  end
end
