Rails.application.routes.draw do
  resources :cards do
    post 'simple_test', on: :collection
  end

  resources :user do
  resources :cards
  end

  get 'new' => 'cards#new'
  get 'user' => 'user#index'
  root 'home#index'
end
