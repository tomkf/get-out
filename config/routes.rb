Rails.application.routes.draw do
  devise_for :users

  get 'search', to: 'posts#search', as: :search_posts

  resources :bookings, except: [:new, :create, :destroy]


  resources :posts do
    resources :photos, only: [:new, :create, :destroy]
    resources :bookings, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end
