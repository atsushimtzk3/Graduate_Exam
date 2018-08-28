Rails.application.routes.draw do

  root to: 'blogs#top'
  
  resources :blogs do
    collection do
      post :confirm
      get :recruit
    end
  end  

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
  
  resources :users, only: [:index, :show]
  resources :applicants, only: [:index, :show]
  resources :favorites, only: [:create, :destroy]
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
