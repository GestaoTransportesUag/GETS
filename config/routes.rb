Rails.application.routes.draw do
  resources :manutencaos
  resources :viagems
  get 'welcome/index'

  resources :veiculos
  resources :motorista
  resources :usuarios
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
