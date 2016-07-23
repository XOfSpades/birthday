class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.integer :person_id
      t.date :date

      t.timestamps
    end
  end
end
