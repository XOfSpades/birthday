class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  has_many :parties, class_name: '::Party'
  has_many :wish_list_items, class_name: '::WishListItem'
end
