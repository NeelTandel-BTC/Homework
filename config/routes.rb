Rails.application.routes.draw do
  devise_for :cleaners, controllers: { sessions: 'cleaners/sessions', registrations: 'cleaners/registrations'}
  
  devise_for :customers, controllers: { sessions: 'customers/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'customers#index'
end
