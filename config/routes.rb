
Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :pros, controllers: {
    registrations: "pros/registrations",
    sessions: 'pros/sessions',
    passwords: 'pros/passwords'
  }
  get 'products/index'
  authenticated :pro do
      root 'products#index', as: :authenticated_pro_root
  end


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
  get 'pros', to: 'pages#pros'
  get 'faq', to: 'pages#faq'
  get 'contact', to: 'pages#contact'
  get 'mentions_legales', to: 'pages#mentions_legales'
  get 'cgu', to: 'pages#cgu'
  get 'welcome', to: 'pages#welcome'


  resources :users, only: [ :show, :update, :edit] do
    collection do
        patch 'update_password'
      end
  end

  resources :pros, only: [:show, :edit, :update] do
    member do
        patch 'update_password'
        get 'my_campaigns'
      end
  end
  resources :leads, only: [ :create ]
  resources :products, only: [:index, :new, :create, :edit, :update], shallow: true do
    resources :campaigns, only: [:new, :create, :show, :index ]
  end

  get '/campaigns/:id', to: 'campaigns#promo', as: 'promo'

  get 'more_infos', to: 'leads#more_infos'

end
