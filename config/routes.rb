Rails.application.routes.draw do

  devise_for :cleaners, controllers: { sessions: 'cleaners/sessions', registrations: 'cleaners/registrations' }
  devise_for :customers, controllers: { sessions: 'customers/sessions', registrations: 'customers/registrations' }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customer_bookings 
  get 'cleaner_bookings', to: 'cleaner_bookings#index'
  root 'customer_bookings#index'
end
