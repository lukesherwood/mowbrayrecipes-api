Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             class_name: 'User',
             controllers: {
               sessions: 'api/v1/sessions',
               registrations: 'api/v1/registrations'
             },
             path_prefix: '/api/v1'
  namespace :api do 
    namespace :v1 do
      resources :recipes
      devise_scope :user do
        get '/users/auto_login', to: 'sessions#auto_login' 
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
