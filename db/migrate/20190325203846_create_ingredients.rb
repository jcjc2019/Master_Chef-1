class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.string :origin_country, default: "N/A"
      t.timestamps
    end
  end
end
