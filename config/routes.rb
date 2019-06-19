Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  #デバッグ用
  #root to: 'tasks#index'
  #root to: 'taskusers#index'
  
  resources :tasks
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'taskusers#new'
  resources :taskusers, only: [:new, :create]
end
