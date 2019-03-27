require 'csv'
class Recipe < ApplicationRecord
    has_and_belongs_to_many :cook_books
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true
    validates :cook_time, presence: true
    
     def self.import(file)
         CSV.foreach(file, :headers => true) do |row|
             Recipe.create!(row.to_hash)
         end
     end    
end
