Rails.application.routes.draw do
  resources :cards

<<<<<<< 42b57d435d71c25a16ab30e2ecf81c8df1aa77c7
=======
  get 'new' => 'cards#new'

>>>>>>> install validation and date+3
  root 'home#index'
end
