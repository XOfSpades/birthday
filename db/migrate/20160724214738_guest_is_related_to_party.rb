class GuestIsRelatedToParty < ActiveRecord::Migration[5.0]
  def change
    rename_column :guests, :inviter_id, :party_id
  end
end
