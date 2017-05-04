Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :todos

  resources :sessions, only: [:new, :create]
end
