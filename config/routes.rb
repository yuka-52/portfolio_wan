Rails.application.routes.draw do
  get 'sights/index'
  get 'protections/index'
  get 'searches/index'
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'top#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update]
  get 'users/sign_in', to: 'users/sessions#new'
  get 'users/sign_up', to: 'users/registrations#new'
  get 'users/show', to: "users#show"
  resources :searches
  post 'searches/:id/edit', to: 'searches#edit'
  resources :protections
  post 'protections/:id/edit', to: 'protections#edit'
  resources :sights
  post 'sights/:id/edit', to: 'sights#edit'
end
