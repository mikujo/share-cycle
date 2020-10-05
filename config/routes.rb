Rails.application.routes.draw do
  get 'cycles/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'user/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "cycles#index"
  resources :users, only: [:edit, :update]
  resources :cycles
end
