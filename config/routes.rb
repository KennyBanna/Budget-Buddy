Rails.application.routes.draw do
  
  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  
  resources :budget
  
  resources :budget_events # Nest this?
  
end
