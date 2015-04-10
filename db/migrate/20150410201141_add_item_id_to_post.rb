class AddItemIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :item_id, :integer
  end
end
