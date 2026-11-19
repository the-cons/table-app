class AddUniqueIndexToMenuItems < ActiveRecord::Migration[8.1]
  def change
    add_index :menu_items, [:restaurant_id, :name], unique: true
  end
end
