class Party < ApplicationRecord
  validates_presence_of :person, :date
  belongs_to :person
end
