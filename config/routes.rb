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
  get '/biz_favs', to: 'bizlists#favs'
  get '/biz_most_ratings', to: 'businesses#most_ratings'
  get '/biz_filter_within_last_24_hours', to: 'bizlists#last_day'
  get '/remove_bizlist', to: 'bizlists#list_destroy'
  get '/add_biz_as_favorite', to: 'businesses#fav'
  get '/auth/google/callback', to: 'users#google_login'
  get '*path', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
