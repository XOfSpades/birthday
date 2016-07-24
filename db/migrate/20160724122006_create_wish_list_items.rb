class CreateWishListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :wish_list_items do |t|
      t.string :name
      t.float :price
      t.string :img_url
      t.string :location
      t.integer :person_id

      t.timestamps
    end
  end
end
