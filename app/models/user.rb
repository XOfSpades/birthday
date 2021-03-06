class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :email
  has_many :parties, class_name: '::Party'
  has_many :wish_list_items, class_name: '::WishListItem'
  has_many :guests, class_name: '::Guest'

  def full_name
    "#{first_name} #{last_name}"
  end

  def on_guest_list
    Guest.where(user_id: id)
  end
end
