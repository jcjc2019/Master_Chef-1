Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :cook_books
  resources :ingredients
  resources :recipes
  resources :users 
  resources :sessions
  resources :cook_book_recipes

  get 'users/import' => 'users#my_import'
  root to: 'sessions#index'

  put '/recipes/:id/add_likes', to: 'recipes#add_likes', as: 'add_likes' #add patch route under this route. 
  post '/sessions/new', to: 'sessions#create' 
  
  get '/search' => 'pages#search', :as => 'search_page'

  post '/users/:id', to:'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
       