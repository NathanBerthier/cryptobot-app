Rails.application.routes.draw do
  root to: 'pages#home'
  resources :bobs, only: %i[update]
end
