Rails.application.routes.draw do
    resources :add_examinations
    resources :substitutes
    resources :subjects
    devise_for :users, controllers: {
        confirmations: 'users/confirmations',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
    }
    devise_scope :user do
        post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    end

    get 'contacts/new'
    get 'contacts/create'

    root 'static_pages#home'
    get '/help', to:'static_pages#help'
    get '/about', to:'static_pages#about'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
