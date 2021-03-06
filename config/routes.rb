Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'toppages/index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #　前回までのルートはtasks@rootだったのをtoppages#indexに変更
  # root to: 'tasks#index'
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [ :index, :show, :new, :create ]
  
  resources :tasks
end
