Rails.application.routes.draw do
  resources :reviews
  resources :business_reviews
  resources :businesses do
    get 'add', to: 'businesses#add'
  end
  resources :businesses
  resources :users, only: [:new, :create] do
    resources :bizlists do
      get 'add', to: 'bizlists#add'
    end
  end
  resources :bizlists
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '*path', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
