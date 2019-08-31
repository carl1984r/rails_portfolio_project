Rails.application.routes.draw do
  resources :bizlists
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
