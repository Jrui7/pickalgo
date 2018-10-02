Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'home', to: 'pages#home'
  get 'faq', to: 'pages#faq'
  get 'contact', to: 'pages#contact'
  get 'mentions_legales', to: 'pages#mentions_legales'
  get 'cgu', to: 'pages#cgu'

end
