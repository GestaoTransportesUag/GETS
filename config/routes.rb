Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'

  resources :veiculos
  resources :motorista
  resources :usuarios
  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
