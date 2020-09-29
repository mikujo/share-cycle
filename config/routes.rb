Rails.application.routes.draw do
  devise_for :users
  resources :user, only: [:edit, :update, :show]
end
