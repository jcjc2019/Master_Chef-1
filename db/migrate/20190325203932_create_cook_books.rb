class CreateCookBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cook_books do |t|
      t.string :name, default: "My Cookbook"
      t.belongs_to :user, foreign_key: true 
      t.belongs_to :recipe, foreign_key: true 
      t.timestamps
    end
  end
end
