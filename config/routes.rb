Rails.application.routes.draw do
  get 'cycles/index'
  devise_for :users
  root to: "cycles#index"
  resources :users, only: [:edit, :update, :show]
  resources :cycles
end
