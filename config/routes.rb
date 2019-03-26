Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :cook_books
  resources :ingredients
  resources :recipes
  resources :users
  resources :sessions
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
    