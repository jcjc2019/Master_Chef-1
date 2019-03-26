Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :cook_books
  resources :ingredients
  resources :recipes
  patch '/recipes/:id/add_likes', to: 'recipes#add_likes' #add patch route under this route.

  resources :users

  resources :sessions
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
    