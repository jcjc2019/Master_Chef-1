class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    
    validates :name, presence: true

    def self.recipes_with(name)
        Recipe.find_by!(name:name).ingredients
    end

    def self.recipe_counts
        self.recipes.length
    end

    def recipe_list
        recipes.map(&:name).join(', ')
    end

    # def recipe_list=(names)
    #     self.recipes = names.split(',').map do |n|
    #         Recipe.where(name: n.strip).first_or_create!
    #     end
    # end
end
