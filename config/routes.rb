Rails.application.routes.draw do
  resources :add_examinations
  resources :substitutes
  resources :subjects
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  root 'static_pages#home'
  
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
