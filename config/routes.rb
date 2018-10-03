Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  authenticated :user do
      root 'pages#welcome', as: :authenticated_root
  end

  root to: 'pages#home'

  get 'home', to: 'pages#home'
  get 'faq', to: 'pages#faq'
  get 'contact', to: 'pages#contact'
  get 'mentions_legales', to: 'pages#mentions_legales'
  get 'cgu', to: 'pages#cgu'
  get 'welcome', to: 'pages#welcome'


  resources :users, only: [ :show, :update]

end
