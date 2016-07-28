class WishListItem < ApplicationRecord
  belongs_to :user
  has_one :reservations, class_name: '::Reservation'
  validates_presence_of :name, :location, :img_url, :price, :user

  def reserved_by
    reservation = Reservation.find_by(wish_list_item_id: id)
    reservation.user if reservation
  end
end
