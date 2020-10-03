Rails.application.routes.draw do
  get 'cycles/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "cycles#index"
  resources :users, only: [:edit, :update]
  resources :cycles
end
