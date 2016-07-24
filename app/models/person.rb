class Person < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  has_many :parties, class_name: '::Party'
end
