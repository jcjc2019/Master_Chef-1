class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :language, default: "English"
      t.string :region
      t.text :instructions
      t.text :history
      t.text :comment
      t.string :cook_time
      t.string :origin_century
      t.string :spicy_level
      t.string :sugar_level
      t.string :calories
      t.integer :likes
      t.string :img_url
      t.timestamps
    end
  end
end
