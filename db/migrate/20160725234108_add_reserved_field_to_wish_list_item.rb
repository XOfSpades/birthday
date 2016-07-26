class AddReservedFieldToWishListItem < ActiveRecord::Migration[5.0]
  def change
    add_column :wish_list_items, :reserved, :boolean
  end
end
