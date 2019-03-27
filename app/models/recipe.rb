# require 'csv'
class Recipe < ApplicationRecord
    has_many :cook_books
    has_many :users, through: :cook_books
    
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true
    validates :cook_time, presence: true
    
    #  def self.import(file)
    #      CSV.foreach(file, :headers => true) do |row|
    #          Recipe.create!(row.to_hash)
    #      end
    #  end    

    def self.ingredients_with(name)
        Ingredient.find_by!(name:name).recipes
    end

    def self.ingredient_counts
        Ingredient.select('ingredients.*, count(recipe_ingredients.ingredient_id) as count').joins(:recipe_ingredients).group('recipe_ingredients.ingredient_id')
    end

    def ingredient_list
        ingredients.map(&:name).join(', ')
    end

    def ingredient_list=(names)
        self.igredients = names.split(',').map do |n|
            Ingredient.where(name: n.strip).first_or_create!
        end
    end

end
