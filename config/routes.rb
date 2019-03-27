Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :cook_books
  resources :ingredients
  resources :recipes
  resources :users
  resources :sessions
  patch '/recipes/:id/add_likes', to: 'recipes#add_likes' #add patch route under this route. 
  #get '/login', to:'sessions#new'
  post '/sessions/new', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
       