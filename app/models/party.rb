class Party < ApplicationRecord
  validates_presence_of :user, :date, :title
  belongs_to :user

  def wish_list
    user.wish_list_items
  end

  def on_guest_list?(guest)
    Guest.where(party: id).where(user_id: guest.id).any?
  end
end
