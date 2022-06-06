Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :edit]
  get 'users/sign_in', to: 'users/sessions#new'
  get 'users/sign_up', to: 'users/registrations#new'
end
