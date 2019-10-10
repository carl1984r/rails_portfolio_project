Rails.application.routes.draw do
  resources :reviews
  resources :businesses do
    resources :reviews
  end
  resources :users, only: [:new, :create] do
    resources :bizlists do
      get 'add', to: 'bizlists#add'
      get 'remove', to: 'bizlists#remove'
    end
  end
  resources :bizlists
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/biz_search', to: 'bizlists#search'
  get '/biz_filter_within_last_24_hours', to: 'bizlists#last_day'
  get '*path', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
