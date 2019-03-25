class Recipe < ApplicationRecord
    has_many :cook_books
    has_many :users, through: :cook_books
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true
    validates :cook_time, presence: true
    
end
