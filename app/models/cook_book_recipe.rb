class CookBookRecipe < ApplicationRecord
    belongs_to :cook_book
    belongs_to :recipe
end