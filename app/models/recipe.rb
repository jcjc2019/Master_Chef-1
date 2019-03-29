class Recipe < ApplicationRecord
    #has_and_belongs_to_many :cook_books
    has_many :cook_book_recipes
    has_many :cook_books, through: :cook_book_recipes
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true
    validates :cook_time, presence: true
    accepts_nested_attributes_for :ingredients
    

    def self.ingredients_with(name)
        Ingredient.find_by!(name:name).recipes
    end

    def self.ingredient_counts
        Ingredient.select('ingredients.*, count(recipe_ingredients.ingredient_id) as count').joins(:recipe_ingredients).group('recipe_ingredients.ingredient_id')
    end

    def ingredients_attributes=(ingredient_attributes)
        ingredient_attributes.values.each do |ingredient_attribute|
            ingredient = Ingredient.find_or_create_by(ingredient_attribute)
            self.ingredients << ingredient
        end
    end

    # def self.search(search)
    #     if search
    #         ingredient = Ingredient.find_by(name:search)
    #         if ingredient
    #             self.where(ingredient_id: ingredient)
    #         else
    #             Recipe.all
    #         end
    #     else
    #         Recipe.all
    #     end
    # end

    def self.search(name)
        if name
            where('name LIKE ?', "%#{name}%").order('id DESC')
        else
            all
        end
    end

end
