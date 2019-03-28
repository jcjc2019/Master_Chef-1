class CookBook < ApplicationRecord
    #has_and_belongs_to_many :recipes
    has_many :cook_book_recipes
    has_many :recipes, through: :cook_book_recipes
    belongs_to :user



    validates :name, presence: true
    accepts_nested_attributes_for :recipes

    def recipes_attributes=(recipes_attributes)
        recipes_attributes.values.each do |recipe_attribute|
            my_recipes = Recipe.find_or_create_by(recipe_attribute)
            self.recipes << my_recipes
        end
    end
end
