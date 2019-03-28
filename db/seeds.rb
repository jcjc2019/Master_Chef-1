require 'csv'
require 'activerecord-import'
require_relative '../config/environment'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.destroy_all
User.destroy_all
Ingredient.destroy_all
adam = User.new({ :username => "Adam Moran",  :password => "Adam", :translator => false })
adam.hash_password # calling the method in user model
adam.save

cory = User.new({ :username => "Cory Harper",  :password => "Cory", :translator => false })
cory.hash_password 
cory.save

eli = User.new({ :username => "Eli Lauffenburger",  :password => "Eli", :translator => false })
eli.hash_password 
eli.save

hema = User.new({ :username => "Hemalatha Murugan",  :password => "Hema", :translator => true })
hema.hash_password 
hema.save

jack = User.new({ :username => "Jack Rotta",  :password => "Jack", :translator => false })
jack.hash_password 
jack.save

jessica = User.new({ :username => "Jessica Brumfield",  :password => "Jessica", :translator => false })
jessica.hash_password 
jessica.save

jing = User.new({ :username => "Jing Chen",  :password => "Jing", :translator => true })
jing.hash_password 
jing.save

jose = User.new({ :username => "Josephine Yao",  :password => "Jose", :translator => true })
jose.hash_password 
jose.save

mark = User.new({ :username => "Mark Pothecary",  :password => "Mark", :translator => false })
mark.hash_password 
mark.save

olivia = User.new({ :username => "Olivia Auzenne",  :password => "Olivia", :translator => false })
olivia.hash_password 
olivia.save

robert = User.new({ :username => "Robert Vidal",  :password => "Robert", :translator => false })
robert.hash_password 
robert.save

rochell = User.new({ :username => "Rochell Flood",  :password => "Rochell", :translator => false })
rochell.hash_password 
rochell.save

theo = User.new({ :username => "Theodore Kimana",  :password => "Theo", :translator => false })
theo.hash_password 
theo.save

tom = User.new({ :username => "Thomas Hansen",  :password => "Tom", :translator => false })
tom.hash_password 
tom.save

trey = User.new({ :username => "Trey Beauchamp",  :password => "Trey", :translator => false })
trey.hash_password 
trey.save

zoe = User.new({ :username => "Zoe Bai",  :password => "Zoe", :translator => true })
zoe.hash_password 
zoe.save 


chicken = Ingredient.create(name: "Chicken", description: "Chicken meat.")
pork = Ingredient.create(name: "Pork", description: "Pork meat.")
fish = Ingredient.create(name: "Fish", description: "Fish meat.")
tofu = Ingredient.create(name: "Tofu", description: "Pork meat", origin_country: "China")
peanut = Ingredient.create(name: "Peanut", description: "Peanut, Arachis hypogaea, is an herbaceous annual plant in the family Fabaceae grown for its oil and edible nuts. Peanut plants are small, usually erect, thin stemmed plants with feather-like leaves.", origin_country: "countries in South America")


class Rectable
  def initialize()
    @csv = CSV.new(File.read(File.join(File.dirname(__FILE__),"../db/recipes.csv")), encoding: 'ISO-8859-1', headers: true)
  end

  def seed
    @csv.map do |row|
      row = row.to_hash
      #create tables for recipes

      recipe = Recipe.create({ 
          name: row['name'], 
          language: row['language'], 
          region: row['region'], 
          instructions: row['instructions'], 
          history: row['history'],
          cook_time: row['cook_time'],
          origin_century: row['origin_century'],
          spicy_level: row['spicy_level'],
          sugar_level: row['sugar_level'],
          calories: row['calories'],
          likes: row['likes'],
          img_url: row['img_url'],
          comment: row['comment'] })

#create join table by grab previous tables' ids and second table's ids

      cook_book = CookBook.create({
            name: row['cookbook_name']})
            #recipe_id: recipe.id})
            # user_id: user.id

    #   ingredient = Ingredient.find_or_create_by({
    #       name: row['ingredient_name'],
    #       description: row['ingredient_description'],
    #       origin_century: row['ingredient_origin_country']
    #   })


    end
end
end

Rectable.new().seed
