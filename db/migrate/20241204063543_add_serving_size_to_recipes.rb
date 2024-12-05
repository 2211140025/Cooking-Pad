class AddServingSizeToRecipes < ActiveRecord::Migration[6.1]
  def change
    unless column_exists?(:recipes, :serving_size)
      add_column :recipes, :serving_size, :integer
    end
  end
end
