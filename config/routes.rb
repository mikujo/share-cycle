Rails.application.routes.draw do
  get 'cycles/index'
  devise_for :users
  root to: "cycles#index"
  resources :user, only: [:edit, :update, :show]
end
