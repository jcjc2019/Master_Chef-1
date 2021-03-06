class Recipe < ApplicationRecord
    #has_and_belongs_to_many :cook_books
    has_many :cook_book_recipes
    has_many :cook_books, through: :cook_book_recipes
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true
    validates :cook_time, presence: true
    accepts_nested_attributes_for :ingredients
    
    def self.counts
        self.all.count
    end

    def self.health
        self.all.sort_by { |r|r.calories}.first
    end

    def self.unhealth
        self.all.sort_by { |r|r.calories}.last
    end

    def self.hot_dishes
        self.all.select{|r|r.spicy_level == "hot"}
    end

    def self.most_sweet_dish
        self.all.sort_by { |r|r.sugar_level}.last
    end

    def self.least_sweet_dish
        self.all.sort_by { |r|r.sugar_level}.first
    end

    def self.most_popular_dish
        self.all.sort_by { |r|r.likes}.last       
    end

    def self.top_three_popular_dishes
        self.all.sort_by { |r|r.likes}.last(3).reverse      
    end

    def self.least_popular_dish
        self.all.sort_by { |r|r.likes}.first       
    end

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

    def self.search(search)
        search = search.capitalize
        selected_ingredient = Ingredient.find_by(name:search)
        if selected_ingredient
            Recipe.all.select do |recipe|
            recipe.ingredients.include?(selected_ingredient)
            end
        end    
    end

    
end
