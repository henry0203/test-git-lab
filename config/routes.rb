Rails.application.routes.draw do
  devise_for :users
  resources :lamas do
    resources :reviews, only: [:create]
    resources :bookings, only: [:new, :create, :show] do
      resources :payments, only: [:new, :create]
    end
  end

  get 'reviews', to: 'reviews#index'
  get 'bookings', to: 'bookings#index'
  patch 'bookings', to: 'bookings#update'
  root to: 'pages#home'
end
