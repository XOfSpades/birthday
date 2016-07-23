class CreatePresents < ActiveRecord::Migration[5.0]
  def change
    create_table :presents do |t|
      t.string :name
      t.string :img_url
      t.integer :person_id

      t.timestamps
    end
  end
end
