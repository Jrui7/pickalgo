
Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :pros, controllers: {
    registrations: "pros/registrations",
    sessions: 'pros/sessions',
    passwords: 'pros/passwords'
  }
  get 'pros/show'
  authenticated :pro do
      root 'pros#show', as: :authenticated_pro_root
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
    collection do
        patch 'update_password'
      end
  end
  resources :leads, only: [ :create ]
  resources :products, only: [:index, :new, :create, :edit, :update], shallow: true do
    resources :campaigns, only: [:new, :create, :update, :show, :index ]
  end

  get 'more_infos', to: 'leads#more_infos'

end
