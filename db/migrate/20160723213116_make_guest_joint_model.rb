class MakeGuestJointModel < ActiveRecord::Migration[5.0]
  def change
    rename_column :guests, :person_id, :inviter_id
    add_column :guests, :person_id, :integer
  end
end
