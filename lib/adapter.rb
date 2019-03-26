class Csv

  def initialize()
    @csv = CSV.new(File.read(File.join(File.dirname(__FILE__),"../db/recipes.csv")), headers: true)
  end

  def seed
    @csv.map do |row|
      row = row.to_hash
      #create tables for all classes
      user = User.find_or_create_by({ 
          username: row['username'], 
          password: row['password'],
          translator: row['translator']})

      recipe = Recipe.find_or_create_by({ 
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

      cook_book = CookBook.find_or_create_by({ 
          name: row['cookbook_name'], 
          recipe_id: recipe.id,
          user_id: user.id})

      ingredient = Ingredient.find_or_create_by({
          name: row['ingredient_name'],
          description: row['ingredient_description'],
          origin_century: row['ingredient_origin_country']
      })

      #create join table by grab previous tables' ids and second table's ids

      RecipeIngredient.create({
          recipe_id: recipe.id, 
          ingredient_id: ingredient.id})
    end
  end
end