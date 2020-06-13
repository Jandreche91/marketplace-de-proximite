Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :courgettes do
    resources :bookings, only: [:new, :create, :edit]
    resources :reviews, only: [ :new, :create, :destroy ]
  end

  resources :bookings, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
