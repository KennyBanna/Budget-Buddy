Rails.application.routes.draw do

  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:show]
  resources :budget
  resources :budget_events # Nest this?
  
end
