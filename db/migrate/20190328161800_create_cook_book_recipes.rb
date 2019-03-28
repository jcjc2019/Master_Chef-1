class CreateCookBookRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :cook_book_recipes do |t|
      t.belongs_to :cook_book
      t.belongs_to :recipe
    end
  end
end
