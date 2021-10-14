Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bobs, only: %i[update]
end
