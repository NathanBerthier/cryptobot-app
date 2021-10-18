Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'graphic', to: 'pages#graphic'
  resources :bobs, only: %i[update]
end
