class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.integer :serving_size, null: false
      t.text :content
      t.text :tips
      t.string :image
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end