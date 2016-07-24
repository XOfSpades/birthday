class Party < ApplicationRecord
  validates_presence_of :person, :date, :title
  belongs_to :person
end
