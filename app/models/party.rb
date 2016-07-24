class Party < ApplicationRecord
  validates_presence_of :person, :date, :title
  belongs_to :person

  def wish_list
    person.wish_list_items
  end
end
