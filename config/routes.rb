Rails.application.routes.draw do
  get 'cycles/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'user/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "cycles#index"
  resources :cycles do
    resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy] do
      collection do
        get 'search'
      end
      resources :comments, only: [:create, :destroy] 
    end
  end
end
