class WishListItem < ApplicationRecord
  belongs_to :person
  validates_presence_of :name, :location, :img_url, :price, :person
end
