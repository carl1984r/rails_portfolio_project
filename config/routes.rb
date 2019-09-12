Rails.application.routes.draw do
  resources :business_reviews
  resources :businesses
  resources :users, only: [:new, :create] do
    resources :bizlists
  end
  resources :bizlists
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
