class AddNameRelatedDataToGuest < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :first_name, :string
    add_column :guests, :last_name, :string
  end
end
