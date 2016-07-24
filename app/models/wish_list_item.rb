class WishListItem < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :location, :img_url, :price, :user
end
