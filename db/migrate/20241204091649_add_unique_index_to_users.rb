class AddUniqueIndexToUsers < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :user_id, unique: true
  end
end
