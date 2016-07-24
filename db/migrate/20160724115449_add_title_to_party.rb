class AddTitleToParty < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :title, :string
  end
end
