Rails.application.routes.draw do
  resources :cards do
    post 'simple_test', on: :collection
  end

  resources :user do
  resources :cards
  end

  get 'new' => 'cards#new'
  root 'home#index'
end
