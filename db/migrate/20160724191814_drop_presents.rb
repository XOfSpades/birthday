class DropPresents < ActiveRecord::Migration[5.0]
  def up
    drop_table :presents
  end

  def down
    raise 'Irreversable migration'
  end
end
