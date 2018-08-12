Rails.application.routes.draw do

  root to: 'blogs#index'  

  devise_for :applicants, controllers: {
  sessions:      'applicants/sessions',
  passwords:     'applicants/passwords',
  registrations: 'applicants/registrations'
  }
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
