class CreateJoinTableCookBookRecipe < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cook_books, :recipes do |t|
      t.index [:cook_book_id, :recipe_id]
    end
  end
end
