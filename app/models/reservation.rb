class Reservation < ApplicationRecord
  validates_presence_of :wish_list_item, :user
  belongs_to :wish_list_item
  belongs_to :user
end
