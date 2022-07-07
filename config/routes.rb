Rails.application.routes.draw do
  root 'tops#index'
  get 'finders/finder'
  get 'sights/index'
  get 'protections/index'
  get 'searches/index'
  get 'protections/search'
  get 'sights/search'
  get 'searches/finder'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  get 'tops/index', to: 'tops#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:show, :edit, :update]
  get 'users/sign_in', to: 'users/sessions#new'
  get 'users/sign_up', to: 'users/registrations#new'
  get 'users/show', to: "users#show"
  resources :searches do
    resources :comments, only: [:create]
  end
  post 'searches/:id/edit', to: 'searches#edit'
  resources :protections
  post 'protections/:id/edit', to: 'protections#edit'
  resources :sights do
    resources :boards, only: [:create]
  end
  post 'sights/:id/edit', to: 'sights#edit'
  resources :notifications, only: :index
end
