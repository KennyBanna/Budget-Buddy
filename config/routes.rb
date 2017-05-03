Rails.application.routes.draw do
  
  get 'users/new'

  get 'users/create'

  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  resources :budget
  
  resources :budget_events # Nest this?
  
end
