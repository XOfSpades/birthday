class DeleteReservedColFromWishListItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :wish_list_items, :reserved
  end
end
