Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :manutencaos
  resources :viagems
  get 'welcome/index'

  resources :veiculos
  resources :motorista
  resources :usuarios
  root 'welcome#index'

  get 'signup', to: 'usuarios#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
