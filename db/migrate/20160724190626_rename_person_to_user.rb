class RenamePersonToUser < ActiveRecord::Migration[5.0]
  def change
    rename_table :people, :users
    rename_column :wish_list_items, :person_id, :user_id
    rename_column :parties, :person_id, :user_id
    rename_column :guests, :person_id, :user_id
    rename_column :presents, :person_id, :user_id
  end
end
