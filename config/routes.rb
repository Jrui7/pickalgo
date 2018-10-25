
Rails.application.routes.draw do
  devise_for :pros, controllers: {
    registrations: "pros/registrations",
    sessions: 'pros/sessions',
    passwords: 'pros/passwords'
  }
  get 'pros/show'
  get 'users/show'
  devise_for :users, :controllers => { :registrations => :registrations }
  authenticated :user do
      root 'pages#welcome', as: :authenticated_root
  end

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
      mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'

  get 'home', to: 'pages#home'
  get 'partners', to: 'pages#partners'
  get 'faq', to: 'pages#faq'
  get 'contact', to: 'pages#contact'
  get 'mentions_legales', to: 'pages#mentions_legales'
  get 'cgu', to: 'pages#cgu'
  get 'welcome', to: 'pages#welcome'


  resources :users, only: [ :show, :update]
  resources :pros, only: [:show, :update]
  resources :leads, only: [ :create ]

  get 'more_infos', to: 'leads#more_infos'

end
