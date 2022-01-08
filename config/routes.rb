Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :clubs
  post 'clubs/signup', to: 'clubs#signup'
  resources :posts do
    resources :comments
  end
  devise_scope :user do
    get 'sessions/form', to: 'users/sessions#form'
    get 'registrations/form', to: 'users/registrations#form'
  end
end
