class AddTipsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :tips, :text
  end
end
