class CreateCookBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cook_books do |t|
      t.string :name
      t.belongs_to :user
      t.belongs_to :recipe
      t.timestamps
    end
  end
end
