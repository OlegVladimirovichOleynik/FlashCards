Rails.application.routes.draw do
  resources :cards

  get 'new' => 'cards#new'

  root 'home#index'
end
